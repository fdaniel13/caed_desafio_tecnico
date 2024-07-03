import 'package:caed_desafio_tecnico/src/auth/auth_controller.dart';
import 'package:caed_desafio_tecnico/src/auth/auth_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module{



@override
  void exportedBinds(Injector i) {
    i.addSingleton(AuthRepository.new);
    i.addSingleton(AuthController.new);
    
    super.exportedBinds(i);
  }
  @override
  void binds(Injector i) {
    super.binds(i);
  }
}