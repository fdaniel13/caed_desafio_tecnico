import 'package:caed_desafio_tecnico/src/auth/auth_repository.dart';

class AuthController{
 AuthRepository _authRepository;
  AuthController(this._authRepository);

   Future<bool> canLogin(
      {required String username, required String pass}) async {
    bool canNavigate = false;

    return canNavigate;
  }

  bool validateUser({required String? username}) {
    bool isValid = username == null || username.isEmpty
        ? false
        : true;

    return isValid;
  }

  bool validatePass({required String? pass}) {

    bool isValid = pass == null || pass.isEmpty
        ? false
        : true;

    return isValid;
  }
}
