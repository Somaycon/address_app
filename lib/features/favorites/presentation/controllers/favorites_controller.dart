import 'package:address_app/features/favorites/domain/usecase/add_favorites_usecase.dart';
import 'package:address_app/features/favorites/domain/usecase/get_favorites_usecase.dart';
import 'package:address_app/features/favorites/domain/usecase/remove_favorites_usecase.dart';
import 'package:address_app/features/favorites/presentation/states/favorites_states.dart';
import 'package:address_app/features/home/domain/entities/address_entity.dart';
import 'package:flutter/foundation.dart';

class FavoritesController {
  final GetFavoritesUsecase getFavoritesUsecase;
  final AddFavoritesUsecase addFavoritesUsecase;
  final RemoveFavoritesUsecase removeFavoritesUsecase;
  ValueNotifier<FavoritesSates> favoritesState = ValueNotifier(
    FavoritesInitialState(),
  );
  final ValueNotifier<List<AddressEntity>> favoriteAddresses = ValueNotifier(
    [],
  );

  FavoritesController({
    required this.getFavoritesUsecase,
    required this.addFavoritesUsecase,
    required this.removeFavoritesUsecase,
  });

  void loadFavorites() async {
    favoritesState.value = FavoritesLoadingState();
    try {
      final favorites = await getFavoritesUsecase();
      if (favorites.isEmpty) {
        favoritesState.value = FavoritesEmptyState();
      } else {
        (favoriteAddresses).value = favorites;
        favoritesState.value = FavoritesLoadedState(addresses: favorites);
      }
    } catch (e) {
      favoritesState.value = FavoritesEmptyState();
    }
  }

  void removeFavorite(AddressEntity address) async {
    await removeFavoritesUsecase(address);
    loadFavorites();
  }
}
