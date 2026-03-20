import 'package:address_app/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:address_app/features/home/domain/entities/address_entity.dart';

class GetFavoritesUsecase {
  final FavoritesRepository repository;

  GetFavoritesUsecase(this.repository);

  Future<List<AddressEntity>> call() {
    return repository.getFavorites();
  }
}
