import 'package:ejara/utils/number_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final formatter = EjaraNumberFormatter();
  test('Correct format test', () {
    var result = formatter.formatNumber("696920908 ");

    String correctFormat = "6 96 92 09 08";

    expect(result, correctFormat);
  });

  test('Correct format with space test', () {
    var result = formatter.formatNumber(" 696920908 ");

    String correctFormat = "6 96 92 09 08";

    expect(result, correctFormat);
  });
}
