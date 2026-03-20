import 'package:address_app/features/favorites/data/datasources/favorites_datasource.dart';
import 'package:address_app/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:address_app/features/home/domain/entities/address_entity.dart';

class FavoritesRepositoryImpl extends FavoritesRepository {
  final FavoritesDatasource favoritesDatasource;

  FavoritesRepositoryImpl({
    required this.favoritesDatasource,
  });
  @override
  Future<void> addFavorite(AddressEntity address) {
    return favoritesDatasource.addFavorite(address);
  }

  @override
  Future<List<AddressEntity>> getFavorites() async {
    return await favoritesDatasource.getFavorites();
  }

  @override
  Future<void> removeFavorite(AddressEntity address) {
    return favoritesDatasource.removeFavorite(address);
  }
}
