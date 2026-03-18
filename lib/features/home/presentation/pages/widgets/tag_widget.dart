import 'package:address_app/features/home/presentation/controller/home_controller.dart';
import 'package:address_app/shared/ui/app_colors.dart';
import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  final String label;
  final HomeController controller;
  const TagWidget({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.selectedLabel,
      builder: (context, value, child) {
        final isSelected = controller.selectedLabel.value == label;
        return GestureDetector(
          onTap: () {
            controller.toggleLabel(label);
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
              border: Border.all(
                color: isSelected
                    ? AppColors.yellow
                    : AppColors.secundaryLightGrey,
                width: 1.5,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.sell_outlined,
                  color: isSelected ? AppColors.yellow : AppColors.grey,
                ),
                SizedBox(width: 4),
                Text(
                  label,
                  style: TextStyle(
                    color: isSelected ? AppColors.brown : AppColors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
