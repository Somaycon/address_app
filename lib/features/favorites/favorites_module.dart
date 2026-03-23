import 'package:address_app/features/app_module.dart';
import 'package:address_app/features/favorites/data/datasources/favorites_datasource.dart';
import 'package:address_app/features/favorites/data/repositories/favorites_repository_impl.dart';
import 'package:address_app/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:address_app/features/favorites/domain/usecase/add_favorites_usecase.dart';
import 'package:address_app/features/favorites/domain/usecase/get_favorites_usecase.dart';
import 'package:address_app/features/favorites/domain/usecase/remove_favorites_usecase.dart';
import 'package:address_app/features/favorites/presentation/controllers/favorites_controller.dart';
import 'package:address_app/features/favorites/presentation/pages/favorites_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FavoritesModule extends Module {
  @override
  List<Module> get imports => [
    AppModule(sharedPreferences: Modular.get()),
  ];
  @override
  void binds(Injector i) {
    i.addLazySingleton(() => GetFavoritesUsecase(i()));
    i.addLazySingleton(() => AddFavoritesUsecase(i()));
    i.addLazySingleton(() => RemoveFavoritesUsecase(i()));
    i.addLazySingleton(() => FavoritesDatasource(sharedPreferences: i()));
    i.addLazySingleton<FavoritesRepository>(FavoritesRepositoryImpl.new);
    i.addLazySingleton(FavoritesController.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => FavoritesPage(),
    );
    super.routes(r);
  }
}
