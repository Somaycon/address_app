import 'package:address_app/shared/ui/app_colors.dart';
import 'package:flutter/material.dart';

class HomeLoadingWidget extends StatelessWidget {
  const HomeLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: AppColors.background,
        child: Center(
          child: CircularProgressIndicator(
            color: AppColors.darkBlue,
          ),
        ),
      ),
    );
  }
}
