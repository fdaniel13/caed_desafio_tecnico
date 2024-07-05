import 'package:caed_desafio_tecnico/core/services/local_data_service/shared_preferences_service.dart';

class SplashScreenRepository {
  final SharedPreferencesService _sharedPreferencesService;

  SplashScreenRepository(this._sharedPreferencesService);

  Future<bool> hasUser() async {
    try {
      final aux = await _sharedPreferencesService.readAcessKey();
      return aux == null ? false : true;
    } catch (error) {
      return false;
    }
  }
}
