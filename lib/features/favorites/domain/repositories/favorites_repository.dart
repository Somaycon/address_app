import 'package:address_app/features/home/domain/entities/address_entity.dart';

abstract class FavoritesRepository {
  Future<List<AddressEntity>> getFavorites();
  Future<void> addFavorite(AddressEntity address);
  Future<void> removeFavorite(AddressEntity address);
}
