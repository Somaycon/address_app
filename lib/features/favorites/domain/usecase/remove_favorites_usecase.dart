import 'package:address_app/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:address_app/features/home/domain/entities/address_entity.dart';

class RemoveFavoritesUsecase {
  final FavoritesRepository repository;

  RemoveFavoritesUsecase(this.repository);

  Future<void> call(AddressEntity address) async {
    await repository.removeFavorite(address);
  }
}
