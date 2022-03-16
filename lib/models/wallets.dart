class Wallet {
  late int id;
  late String name;
  late String number;

  Wallet({
    required this.id,
    required this.name,
    required this.number,
  });

  Wallet.fromJson(Map json) {
    id = json["id"];
    name = json["name"];
    number = json["number"];
  }
}
