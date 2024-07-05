import 'package:caed_desafio_tecnico/src/splash_screen/splash_screen_controller.dart';
import 'package:caed_desafio_tecnico/src/splash_screen/splash_screen_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockSplashScreenRepository extends Mock
    implements SplashScreenRepository {
  @override
  Future<bool> hasUser() async {
    return true;
  }
}

void main() {
  final MockSplashScreenRepository mockSplashScreenRepository =
      MockSplashScreenRepository();
  final splashScreenController =
      SplashScreenController(mockSplashScreenRepository);

  setUp(() {});

  test('Should have user', () async {
    bool aux = await splashScreenController.hasUserAutenticate();
    expect(aux, true);
  });
}
