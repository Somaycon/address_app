import 'package:address_app/features/home/domain/usecase/get_address_usecase.dart';
import 'package:address_app/features/home/presentation/states/home_states.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  final GetAddressUsecase getAddressUsecase;

  final TextEditingController cepController = TextEditingController();
  final ValueNotifier<int> cepDigitsLength = ValueNotifier(0);
  final ValueNotifier<HomeStates> homeStates = ValueNotifier(
    HomeInitialState(),
  );

  HomeController({required this.getAddressUsecase});

  void onCepChanged(String value) {
    final digits = value.replaceAll(RegExp(r'\D'), '');
    final limitedDigits = digits.length > 8 ? digits.substring(0, 8) : digits;

    final formattedCep = limitedDigits.length > 5
        ? '${limitedDigits.substring(0, 5)}-${limitedDigits.substring(5)}'
        : limitedDigits;

    cepDigitsLength.value = limitedDigits.length;

    if (formattedCep == cepController.value.text) return;

    cepController.value = TextEditingValue(
      text: formattedCep,
      selection: TextSelection.collapsed(offset: formattedCep.length),
    );
  }

  void dispose() {
    cepController.dispose();
    cepDigitsLength.dispose();
  }
}
