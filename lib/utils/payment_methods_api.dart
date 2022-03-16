import 'dart:convert';

import 'package:ejara/models/payment_methods.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class PaymentMethodAPI {
  static const String apiUrl =
      "https://testbox-nellys-coin.ejaraapis.xyz/api/v1";

  final JsonCodec _codec = const JsonCodec();

  void fetchPaymentMethods(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    String _url =
        "/marketplace/payment-types-per-country?country_code=CM&type=deposit";

    Uri pmUrl = Uri.parse(apiUrl + _url);

    String apiKey = "838adf51aa";
    String clientId = "jL]riHjAgbUZHofblIPigVgq1";
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

        var pmModel = context.read<PaymentMethodsModel>();

        pmModel.paymentMethods = _paymentMethods;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> login() async {
    final prefs = await SharedPreferences.getInstance();
    Uri _url = Uri.parse(apiUrl + "/auth/login");
    try {
      final response = await http.post(
        _url,
        headers: {
          'api-key': "838adf51aa",
          'client-id': "jL]riHjAgbUZHofblIPigVgq1"
        },
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
}