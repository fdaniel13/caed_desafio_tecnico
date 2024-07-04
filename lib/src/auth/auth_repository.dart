

import 'package:caed_desafio_tecnico/core/models/login_response.dart';
import 'package:caed_desafio_tecnico/core/services/local_data_service/shared_preferences_service.dart';

import '../../core/consts/api_routes.dart';
import '../../core/services/api_services/dio_service.dart';

class AuthRepository{
  final SharedPreferencesService _sharedPreferencesService;
   final DioService _dioService;

   AuthRepository(this._dioService, this._sharedPreferencesService);

  Future<LoginResponse?> signIn({required String username, required String pass}) async {
    try {
        final response= await _dioService.dio
          .post(apiSignIn,data:{
    "user":username,
    "pass":pass
} );

LoginResponse _loginResponse=  LoginResponse.fromJson(response.data);

_sharedPreferencesService.saveAcessKey(acessKey: _loginResponse.acessKey!);
return _loginResponse;
    } catch (error) {

      return null;
    }
  }
}