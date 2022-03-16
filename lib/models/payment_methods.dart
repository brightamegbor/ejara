import 'package:flutter/widgets.dart';

class PaymentMethodsModel extends ChangeNotifier {
  List<PaymentType> _paymentMethods = [];

  List<PaymentType> get paymentMethods => _paymentMethods;

  set paymentMethods(List<PaymentType> value) {
    _paymentMethods = value;
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

  PaymentType({
    required this.id,
    required this.code,
    required this.titleEn,
    required this.titleFr,
    required this.descriptionEn,
    required this.descriptionFr,
    required this.iconImage,
  });

  PaymentType.fromJson(Map json) {
    id = json["id"];
    code = json["code"];
    titleEn = json["title_en"];
    titleFr = json["title_fr"];
    descriptionEn = json["description_en"];
    descriptionFr = json["description_fr"];
    iconImage = json["icon_image"];
  }
}
