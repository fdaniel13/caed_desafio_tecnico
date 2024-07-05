import 'package:caed_desafio_tecnico/core/models/login_response.dart';
import 'package:caed_desafio_tecnico/src/auth/auth_controller.dart';
import 'package:caed_desafio_tecnico/src/auth/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAuthRepository extends Mock implements AuthRepository {
  @override
  Future<LoginResponse?> signIn(
      {required String username, required String pass}) async {
    return LoginResponse.fromJson({"acessKey": "123", "message": "descricao"});
  }
}

void main() {
  final MockAuthRepository mockAuthRepository = MockAuthRepository();
  final authController = AuthController(mockAuthRepository);

  setUp(() {});

  test('Should return true when has user autenticate', () async {
    bool? aux = await authController.signIn(username: "a", pass: "b");
    expect(aux, true);
  });

  test('Should return false for invalid username', () {
    final aux = authController.validateUser(username: "");
    expect(aux, false);
  });
  test('Should return true for valid username', () {
    final aux = authController.validateUser(username: "a");
    expect(aux, true);
  });
  test('Should return false for invalid username', () {
    final aux = authController.validatePass(pass: "");
    expect(aux, false);
  });
  test('Should return true for valid username', () {
    final aux = authController.validatePass(pass: "a");
    expect(aux, true);
  });
}
