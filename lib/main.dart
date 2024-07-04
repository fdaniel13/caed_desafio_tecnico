import 'package:caed_desafio_tecnico/src/app_module.dart';
import 'package:caed_desafio_tecnico/src/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child:const AppWidget()));
}
