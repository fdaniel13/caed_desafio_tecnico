import 'package:caed_desafio_tecnico/src/splash_screen/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({super.key});

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  late Future _data;
  final controller = Modular.get<SplashScreenController>();
  @override
  void initState() {
    _data = controller.hasUserAutenticate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: _data,
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Image.asset(
                  "assets/splash.png",
                  height: 300,
                  width: 300,
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              snapshot.data == true
                  ? Modular.to.navigate("/home")
                  : Modular.to.navigate("/auth");
            }

            return Center(
              child: Image.asset(
                "assets/splash.png",
                height: 300,
                width: 300,
              ),
            );
          }),
    );
  }
}
