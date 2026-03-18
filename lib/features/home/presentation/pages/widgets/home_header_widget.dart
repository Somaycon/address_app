import 'package:address_app/features/home/presentation/controller/home_controller.dart';
import 'package:address_app/features/home/presentation/states/home_states.dart';
import 'package:address_app/shared/ui/app_colors.dart';
import 'package:flutter/material.dart';

class HomeHeaderWidget extends StatelessWidget {
  final HomeController controller;
  const HomeHeaderWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.extraLightGrey,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Buscar por CEP',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Digite o CEP para consultar o endereço',
              style: TextStyle(
                color: AppColors.lightGrey,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            TextFormField(
              onChanged: (cep) {
                controller.onCepChanged(cep);
              },
              style: TextStyle(
                color: AppColors.lightGrey,
                fontSize: 22,
              ),
              keyboardType: TextInputType.number,
              maxLength: 9,
              controller: controller.cepController,
              decoration: InputDecoration(
                fillColor: AppColors.lightGrey.withValues(
                  alpha: 0.1,
                ),
                filled: true,
                counterText: '',
                hintText: '00000-000',
                hintStyle: TextStyle(
                  color: AppColors.lightGrey,
                  fontSize: 22,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 19,
                    vertical: 14,
                  ),
                  child: Text(
                    '#',
                    style: TextStyle(
                      color: AppColors.lightGrey,
                      fontSize: 28,
                    ),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: AppColors.lightGrey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: AppColors.lightBlue,
                    width: 2,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ValueListenableBuilder<int>(
              valueListenable: controller.cepDigitsLength,
              builder: (context, digitsLength, _) {
                return ValueListenableBuilder<HomeStates>(
                  valueListenable: controller.homeStates,
                  builder: (context, state, _) {
                    final indicatorColor = state is HomeErrorState
                        ? AppColors.red
                        : digitsLength == 8
                        ? AppColors.green
                        : AppColors.darkBlue;

                    return LinearProgressIndicator(
                      value: digitsLength / 8,
                      color: indicatorColor,
                    );
                  },
                );
              },
            ),
            SizedBox(height: 3),
            ValueListenableBuilder(
              valueListenable: controller.homeStates,
              builder: (context, value, child) {
                final isError = value is HomeErrorState;
                return Text(
                  isError
                      ? 'CEP inválido. Verifique e tente novamente.'
                      : '${controller.cepDigitsLength.value}/8 dígitos',
                  style: TextStyle(
                    color: isError ? AppColors.red : AppColors.lightGrey,
                    fontSize: 10,
                  ),
                );
              },
              child: Text(
                '${controller.cepDigitsLength.value}/8 dígitos',
                style: TextStyle(
                  color: AppColors.lightGrey,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
