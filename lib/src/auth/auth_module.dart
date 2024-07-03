import 'package:caed_desafio_tecnico/src/auth/auth_controller.dart';
import 'package:caed_desafio_tecnico/src/auth/auth_repository.dart';
import 'package:caed_desafio_tecnico/src/auth/auth_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/services/api_services/dio_service.dart';

class AuthModule extends Module{


  @override
  void binds(Injector i) {
     i.add(DioService.new);
    i.addSingleton(AuthRepository.new);
    i.addSingleton(AuthController.new);
   
    super.binds(i);
  }
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_)=>const AuthWidget() );
    super.routes(r);
  }
}