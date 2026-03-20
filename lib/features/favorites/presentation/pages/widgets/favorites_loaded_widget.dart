import 'package:address_app/features/favorites/presentation/controllers/favorites_controller.dart';
import 'package:address_app/features/favorites/presentation/pages/widgets/favorites_card_widget.dart';
import 'package:flutter/material.dart';

class FavoritesLoadedWidget extends StatelessWidget {
  final FavoritesController controller;
  const FavoritesLoadedWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: ListView.separated(
        itemCount: controller.favoriteAddresses.value.length,
        itemBuilder: (context, index) {
          return FavoritesCardWidget(
            onTap: () => controller.removeFavorite(
              controller.favoriteAddresses.value[index],
            ),
            address: controller.favoriteAddresses.value[index],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 12);
        },
      ),
    );
  }
}
