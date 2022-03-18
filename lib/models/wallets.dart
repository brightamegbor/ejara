import 'dart:convert';

class Wallet {
  late int id;
  late String titleEn;
  late String titleFr;
  late String identification;
  late String phoneNumber;
  late String status;
  late String descriptionEn;
  late String descriptionFr;

  Wallet({
    required this.id,
    required this.titleEn,
    required this.titleFr,
    required this.identification,
    required this.phoneNumber,
    required this.status,
    required this.descriptionEn,
    required this.descriptionFr,
  });

  Wallet.fromJson(Map jsonData) {
    Map _data = json.decode(json.decode(jsonData["data"]));

    id = jsonData["id"];
    titleEn = _data["title_en"];
    titleFr = _data["title_fr"] ?? "";
    identification = jsonData["identification"] ?? "";
    status = jsonData["status"] ?? "";
    descriptionEn = _data["description_en"] ?? "";
    descriptionFr = _data["description_fr"] ?? "";
    phoneNumber = _data["phoneNumber"] ?? "";
  }
}
