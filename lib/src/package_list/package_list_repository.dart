import 'package:caed_desafio_tecnico/core/models/package_model.dart';

import '../../core/consts/api_routes.dart';
import '../../core/services/api_services/dio_service.dart';

class PackageListRepository{

   final DioService _dioService;

   PackageListRepository(this._dioService);


     Future<PackageResponse?> getPackages() async {
    try {
        final response= await _dioService.dio
          .get(getPackage);

PackageResponse _packageResponse=  PackageResponse.fromJson(response.data);

return _packageResponse;
    } catch (error) {

      return null;
    }
  }
}