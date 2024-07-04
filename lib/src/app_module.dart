import 'package:caed_desafio_tecnico/src/auth/auth_module.dart';
import 'package:caed_desafio_tecnico/src/package_list/package_list_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module{


  @override
  void routes(RouteManager r) {
    r.module("/Modular.initialRoute", module: AuthModule());
    r.module(Modular.initialRoute, module: PackageListModule());
    super.routes(r);
  }
}