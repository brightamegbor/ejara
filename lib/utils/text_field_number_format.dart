import 'package:ejara/utils/number_formatter.dart';
import 'package:flutter/services.dart';

class EjaraCustomInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    // format number after each type
    // StringBuffer buffer = StringBuffer();
    // for (int i = 0; i < text.length; i++) {
    //   buffer.write(text[i]);
    //   if (i == 0 && i + 1 != text.length) {
    //     buffer.write(' '); // put space after first number
    //   } else {
    //     int nonZeroIndex = i + 1;
    //     if (nonZeroIndex % 2 == 0 && nonZeroIndex != text.length) {
    //       buffer.write(' '); // put space after each 2 numbers
    //     }
    //   }
    // }
    // String string = buffer.toString();

    // format number after full number is typed
    String string = EjaraNumberFormatter().formatNumber(text);

    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
