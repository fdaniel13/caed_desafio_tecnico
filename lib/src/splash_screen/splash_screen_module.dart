import 'package:flutter_modular/flutter_modular.dart';

import '../../core/services/local_data_service/shared_preferences_service.dart';
import 'splash_screen_controller.dart';
import 'splash_screen_repository.dart';
import 'splash_screen_widget.dart';

class SplashScreenModule extends Module {
  @override
  void binds(Injector i) {
    i.add(SharedPreferencesService.new);
    i.addSingleton(SplashScreenRepository.new);
    i.addSingleton(SplashScreenController.new);

    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const SplashScreenWidget());
    super.routes(r);
  }
}
