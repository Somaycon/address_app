import 'package:address_app/core/network/api_client.dart';
import 'package:address_app/features/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(ApiClient.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.module('/', module: HomeModule());
    super.routes(r);
  }
}
