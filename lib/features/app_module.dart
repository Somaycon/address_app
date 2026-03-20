import 'package:address_app/core/network/api_client.dart';
import 'package:address_app/features/favorites/favorites_module.dart';
import 'package:address_app/features/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppModule extends Module {
  final SharedPreferences sharedPreferences;

  AppModule({
    required this.sharedPreferences,
  });
  @override
  void binds(Injector i) {
    i.addLazySingleton(ApiClient.new);
    i.addInstance<SharedPreferences>(sharedPreferences);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.module('/', module: HomeModule());
    r.module('/favorites', module: FavoritesModule());
    super.routes(r);
  }
}
