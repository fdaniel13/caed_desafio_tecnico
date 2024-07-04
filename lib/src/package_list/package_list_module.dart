import 'package:flutter_modular/flutter_modular.dart';

import '../../core/services/api_services/dio_service.dart';
import 'package_list_controller.dart';
import 'package_list_repository.dart';
import 'package_list_widget.dart';

class PackageListModule extends Module{


  @override
  void binds(Injector i) {
     i.add(DioService.new);
    
    i.addSingleton(PackageListRepository.new);
    i.addSingleton(PackageListController.new);
   
    super.binds(i);
  }
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_)=>const PackageListWidget() );
    super.routes(r);
  }
}