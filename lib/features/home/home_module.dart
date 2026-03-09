import 'package:address_app/features/app_module.dart';
import 'package:address_app/features/home/data/datasources/address_datasource.dart';
import 'package:address_app/features/home/data/repositories/address_repository_impl.dart';
import 'package:address_app/features/home/domain/repositories/address_repository.dart';
import 'package:address_app/features/home/domain/usecase/get_address_usecase.dart';
import 'package:address_app/features/home/presentation/controller/home_controller.dart';
import 'package:address_app/features/home/presentation/pages/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
    AppModule(),
  ];

  @override
  void binds(Injector i) {
    i.addLazySingleton(
      () => GetAddressUsecase(addressRepository: i()),
    );
    i.addLazySingleton(AddressDatasource.new);
    i.addLazySingleton<AddressRepository>(AddressRepositoryImpl.new);
    i.addLazySingleton(HomeController.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => HomePage(),
    );
    super.routes(r);
  }
}
