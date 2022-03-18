class EjaraNumberFormatter {
  String formatNumber(String number) {
    return number.trim().replaceAllMapped(
        RegExp(r'(\d{1})(\d{2})(\d{2})(\d{2})(\d{2})'),
        (Match m) => "${m[1]} ${m[2]} ${m[3]} ${m[4]} ${m[5]}");
  }
}
