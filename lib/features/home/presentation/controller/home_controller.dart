import 'package:flutter/cupertino.dart';

class HomeController {
  final TextEditingController cepController = TextEditingController();

  int get cepDigitsLength =>
      cepController.text.replaceAll(RegExp(r'\D'), '').length;

  void onCepChanged(String value) {
    final digits = value.replaceAll(RegExp(r'\D'), '');
    final limitedDigits = digits.length > 8 ? digits.substring(0, 8) : digits;

    final formattedCep = limitedDigits.length > 5
        ? '${limitedDigits.substring(0, 5)}-${limitedDigits.substring(5)}'
        : limitedDigits;

    if (formattedCep == cepController.text) return;

    cepController.value = TextEditingValue(
      text: formattedCep,
      selection: TextSelection.collapsed(offset: formattedCep.length),
    );
  }
}
