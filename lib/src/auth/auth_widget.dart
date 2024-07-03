import 'package:caed_desafio_tecnico/src/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  final controller = Modular.get<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}