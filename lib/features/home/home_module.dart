import 'package:address_app/features/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
    AppModule(),
  ];
  
}
