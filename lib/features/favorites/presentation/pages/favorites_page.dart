import 'package:address_app/features/favorites/presentation/controllers/favorites_controller.dart';
import 'package:address_app/features/favorites/presentation/pages/widgets/favorites_empty_page_widget.dart';
import 'package:address_app/features/favorites/presentation/pages/widgets/favorites_loaded_widget.dart';
import 'package:address_app/features/favorites/presentation/states/favorites_states.dart';
import 'package:address_app/shared/ui/app_colors.dart';
import 'package:address_app/shared/widgets/app_scaffold_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late FavoritesController controller;
  @override
  void initState() {
    super.initState();
    controller = Modular.get<FavoritesController>();
    controller.loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Row(
          spacing: 10,
          children: [
            Container(
              padding: .all(10),
              decoration: BoxDecoration(
                color: AppColors.lightYellow.withValues(alpha: 0.18),
                borderRadius: .circular(14),
              ),
              child: Icon(
                Icons.star,
                color: AppColors.yellow,
              ),
            ),
            Column(
              spacing: 5,
              crossAxisAlignment: .start,
              mainAxisSize: .min,
              children: [
                Text(
                  'Favoritos',
                  style: TextStyle(
                    fontWeight: .bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  '${controller.favoriteAddresses.value.length} endereço salvos',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        shape: Border(
          bottom: BorderSide(
            color: AppColors.secundaryLightGrey,
            width: 1,
          ),
        ),
      ),
      currentIndex: 1,
      body: ValueListenableBuilder(
        valueListenable: controller.favoritesState,
        builder: (context, value, child) => switch (value) {
          FavoritesInitialState() => SizedBox.shrink(),
          FavoritesLoadingState() => Center(
            child: CircularProgressIndicator(
              color: AppColors.yellow,
            ),
          ),
          FavoritesLoadedState() => FavoritesLoadedWidget(
            controller: controller,
          ),
          FavoritesEmptyState() => FavoritesEmptyPageWidget(),
        },
      ),
    );
  }
}
