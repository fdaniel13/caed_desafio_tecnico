import 'package:caed_desafio_tecnico/src/auth/auth_module.dart';
import 'package:caed_desafio_tecnico/src/package_list/package_list_module.dart';
import 'package:caed_desafio_tecnico/src/splash_screen/splash_screen_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module(Modular.initialRoute, module: SplashScreenModule());
    r.module("/auth", module: AuthModule());
    r.module("/home", module: PackageListModule());
    super.routes(r);
  }
}
