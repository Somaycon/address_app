import 'package:address_app/features/home/domain/entities/address_entity.dart';
import 'package:address_app/shared/ui/app_colors.dart';
import 'package:flutter/material.dart';

class FavoritesCardWidget extends StatelessWidget {
  final AddressEntity address;
  final Function()? onTap;
  const FavoritesCardWidget({super.key, required this.address, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,

        children: [
          Row(
            spacing: 20,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.lightYellow.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                ),
                child: Icon(
                  Icons.star,
                  color: AppColors.yellow,
                ),
              ),
              Column(
                spacing: 4,
                crossAxisAlignment: .start,
                mainAxisSize: .min,
                children: [
                  Text(
                    address.street,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: .bold,
                    ),
                  ),
                  Text(
                    '${address.neighborhood}, ${address.city} - ${address.stateCode}',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.grey,
                    ),
                  ),
                  Text(
                    'CEP ${address.postalCode}',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.lightPink.withValues(alpha: 0.18),
                borderRadius: BorderRadius.circular(
                  16,
                ),
              ),
              child: Icon(
                Icons.delete,
                color: AppColors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
