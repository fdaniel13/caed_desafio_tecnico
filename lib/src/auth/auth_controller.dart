import 'package:caed_desafio_tecnico/src/auth/auth_repository.dart';

class AuthController{
 final AuthRepository _authRepository;
  AuthController(this._authRepository);


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


   Future<bool> signIn( {required String username, required String pass}) async {
   
       return await _authRepository.signIn(username: username,pass: pass);
   
  }
}
