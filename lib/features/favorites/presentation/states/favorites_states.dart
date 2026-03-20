import 'package:address_app/features/home/domain/entities/address_entity.dart';

sealed class FavoritesSates {}

class FavoritesInitialState extends FavoritesSates {}

class FavoritesLoadingState extends FavoritesSates {}

class FavoritesLoadedState extends FavoritesSates {
  final List<AddressEntity> addresses;

  FavoritesLoadedState({
    required this.addresses,
  });
}

class FavoritesEmptyState extends FavoritesSates {}
