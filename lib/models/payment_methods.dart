import 'package:ejara/models/wallets.dart';
import 'package:flutter/foundation.dart';

class PaymentMethodsModel extends ChangeNotifier {
  List<PaymentType> _paymentMethods = [];

  List<PaymentType> get paymentMethods => _paymentMethods;

  set paymentMethods(List<PaymentType> value) {
    _paymentMethods = value;
    notifyListeners();
  }

  bool _isMethodLoading = false;

  bool get isMethodLoading => _isMethodLoading;

  set isMethodLoading(bool value) {
    _isMethodLoading = value;
    notifyListeners();
  }

  bool _isWalletLoading = false;

  bool get isWalletLoading => _isWalletLoading;

  set isWalletLoading(bool value) {
    _isWalletLoading = value;
    notifyListeners();
  }

  List<Wallet> _wallets = [];

  List<Wallet> get wallets => _wallets;

  set wallets(List<Wallet> value) {
    _wallets = value;
    notifyListeners();
  }

  String _selectedMethod = "";

  String get selectedMethod => _selectedMethod;

  set selectedMethod(String value) {
    _selectedMethod = value;
    notifyListeners();
  }

  String _selectedWalletNumber = "";

  String get selectedWalletNumber => _selectedWalletNumber;

  set selectedWalletNumber(String value) {
    _selectedWalletNumber = value;
    notifyListeners();
  }
}

class PaymentType {
  late int id;
  late String code;
  late String titleEn;
  late String titleFr;
  late String descriptionEn;
  late String descriptionFr;
  late String iconImage;
  late String fees; // not provided by the api

  PaymentType({
    required this.id,
    required this.code,
    required this.titleEn,
    required this.titleFr,
    required this.descriptionEn,
    required this.descriptionFr,
    required this.iconImage,
    required this.fees,
  });

  PaymentType.fromJson(Map json) {
    id = json["id"];
    code = json["code"];
    titleEn = json["title_en"];
    titleFr = json["title_fr"];
    descriptionEn = json["description_en"];
    descriptionFr = json["description_fr"];
    iconImage = json["icon_image"];
    fees = json["title_en"].toString().toLowerCase().contains("mobile")
        ? "200CFA"
        : "Variable";
  }
}
