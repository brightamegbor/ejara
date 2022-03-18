import 'dart:convert';

import 'package:ejara/models/payment_methods.dart';
import 'package:ejara/models/wallets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class PaymentMethodAPI {
  String apiUrl = GlobalConfiguration().getValue("api_url");
  String apiKey = GlobalConfiguration().getValue("apiKey");
  String clientId = GlobalConfiguration().getValue("clientId");

  final JsonCodec _codec = const JsonCodec();

  void fetchPaymentMethods(BuildContext context) async {
    var pmModel = context.read<PaymentMethodsModel>();

    final prefs = await SharedPreferences.getInstance();

    // set loading
    pmModel.isMethodLoading = true;

    String _url =
        "/marketplace/payment-types-per-country?country_code=CM&type=deposit";

    Uri pmUrl = Uri.parse(apiUrl + _url);

    String? token = prefs.getString("token");

    try {
      final response = await http.get(pmUrl, headers: {
        'api-key': apiKey,
        'client-id': clientId,
        'authorization': "Bearer $token",
      });

      if (response.statusCode == 200) {
        Map resMap = json.decode(response.body);

        List<PaymentType> _paymentMethods = (resMap["data"] as List)
            .map((pm) => PaymentType.fromJson(pm))
            .toList();

        pmModel.paymentMethods = _paymentMethods;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    // set loading
    pmModel.isMethodLoading = false;
  }

  void fetchPaymentMethodSettings(BuildContext context, String id) async {
    var pmModel = context.read<PaymentMethodsModel>();

    // set loading
    pmModel.isWalletLoading = true;

    final prefs = await SharedPreferences.getInstance();

    String _url =
        "/customer/payment-settings-per-type?paymentTypeId=$id&countryCode=CM&transactionType=buy";

    Uri pmUrl = Uri.parse(apiUrl + _url);

    String? token = prefs.getString("token");

    try {
      final response = await http.get(pmUrl, headers: {
        'api-key': apiKey,
        'client-id': clientId,
        'authorization': "Bearer $token",
      });

      if (response.statusCode == 200) {
        Map resMap = json.decode(response.body);

        List<Wallet> _wallets =
            (resMap["data"] as List).map((pm) => Wallet.fromJson(pm)).toList();

        pmModel.wallets = _wallets;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    // set loading
    pmModel.isWalletLoading = false;
  }

  Future<void> login() async {
    final prefs = await SharedPreferences.getInstance();
    Uri _url = Uri.parse(apiUrl + "/auth/login");
    try {
      final response = await http.post(
        _url,
        headers: {'api-key': apiKey, 'client-id': clientId},
        body: _codec.encode({
          "log": "FlutterDev",
          "password": "flutterTest123!",
        }),
      );

      if (response.statusCode == 200) {
        Map resMap = json.decode(response.body);

        prefs.setString("token", resMap["token"]);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void setDummyMobileWallets(BuildContext context) {
    List<Map> _dummyData = [
      {
        "id": 1,
        "identification": "696920908",
        "data": {
          "title_en": "Orange Money",
        }
      },
      {
        "id": 2,
        "identification": "678897890",
        "data": {
          "title_en": "MTN Mobile Money",
        }
      },
      {
        "id": 3,
        "identification": "690950490",
        "data": {
          "title_en": "Orange Money",
        }
      },
    ];

    List<Wallet> _wallets =
        _dummyData.map((data) => Wallet.fromJson(data)).toList();

    var pmModel = context.read<PaymentMethodsModel>();

    pmModel.wallets = _wallets;
  }
}
