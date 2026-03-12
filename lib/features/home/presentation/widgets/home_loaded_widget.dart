import 'package:address_app/features/home/domain/entities/address_entity.dart';
import 'package:address_app/features/home/presentation/widgets/address_card_widget.dart';
import 'package:address_app/shared/ui/app_colors.dart';
import 'package:flutter/material.dart';

class HomeLoadedWidget extends StatelessWidget {
  final AddressEntity address;
  const HomeLoadedWidget({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: AppColors.background,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ENDEREÇO ENCONTRADO',
                style: TextStyle(
                  color: AppColors.lightGrey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AddressCardWidget(address: address),
            ],
          ),
        ),
      ),
    );
  }
}
