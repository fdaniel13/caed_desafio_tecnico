
import '../../core/consts/api_routes.dart';
import '../../core/services/api_services/dio_service.dart';

class AuthRepository{

   final DioService _dioService;

   AuthRepository(this._dioService);

  Future<bool> signIn({required String username, required String pass}) async {
    try {
        await _dioService.dio
          .post(apiSignIn,data:{
    "user":username,
    "pass":pass
} );
return true;
    } catch (error) {
      return false;
    }
  }
}