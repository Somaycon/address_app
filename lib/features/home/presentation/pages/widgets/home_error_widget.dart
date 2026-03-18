import 'package:address_app/shared/ui/app_colors.dart';
import 'package:flutter/material.dart';

class HomeErrorWidget extends StatelessWidget {
  final String message;
  const HomeErrorWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: AppColors.background,
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.lightPink.withValues(alpha: 0.5),
              ),
              child: Icon(
                Icons.info_outline,
                color: AppColors.red,
                size: 40,
              ),
            ),
            Text(
              message,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              'Verifique o CEP digitado e tente novamente!',
              style: TextStyle(
                color: AppColors.lightGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
