import 'package:flutter/services.dart';

class RatingInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text == '') {
      return newValue;
    } else if (int.parse(newValue.text) > 10) {
      return oldValue;
    }
    return newValue;
  }
}
