import 'package:caed_desafio_tecnico/src/splash_screen/splash_screen_repository.dart';

class SplashScreenController {
  final SplashScreenRepository _splashScreenRepository;
  SplashScreenController(this._splashScreenRepository);

  Future<bool> hasUserAutenticate() async {
    bool hasAcessKey = await _splashScreenRepository.hasUser();

    return hasAcessKey;
  }
}
