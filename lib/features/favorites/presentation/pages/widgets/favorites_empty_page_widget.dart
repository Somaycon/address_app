import 'package:address_app/shared/ui/app_colors.dart';
import 'package:flutter/material.dart';

class FavoritesEmptyPageWidget extends StatelessWidget {
  const FavoritesEmptyPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
          Container(
            padding: .all(10),
            decoration: BoxDecoration(
              color: AppColors.lightYellow.withValues(alpha: 0.18),
              borderRadius: .circular(24),
            ),
            child: Icon(
              Icons.star_outline,
              size: 80,
              color: AppColors.lightYellow,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Nenhum favorito ainda',
            style: TextStyle(
              fontSize: 16,
              fontWeight: .bold,
            ),
          ),
          Text(
            'Busque um endereço e salve nos seus favoritos',
            style: TextStyle(
              color: AppColors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
