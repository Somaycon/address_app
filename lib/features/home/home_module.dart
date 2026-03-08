import 'package:address_app/features/app_module.dart';
import 'package:address_app/features/home/domain/usecase/get_address_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(
      () => GetAddressUsecase.new,
    );
    super.binds(i);
  }

  @override
  List<Module> get imports => [
    AppModule(),
  ];
}
