import 'package:caed_desafio_tecnico/core/models/package_model.dart';

import '../../core/consts/api_routes.dart';
import '../../core/services/api_services/dio_service.dart';
import '../../core/services/local_data_service/shared_preferences_service.dart';

class PackageListRepository {
  final DioService _dioService;
  final SharedPreferencesService _sharedPreferencesService;
  PackageListRepository(this._dioService, this._sharedPreferencesService);

  Future<PackageResponse?> getPackages() async {
    try {
      final response = await _dioService.dio.get(getPackage);

      PackageResponse _packageResponse =
          PackageResponse.fromJson(response.data);
      return _packageResponse;
    } catch (error) {
      return null;
    }
  }

  Future<bool> eraseAcessKey() async {
    try {
      await _sharedPreferencesService.deleteData();
      return true;
    } catch (error) {
      return false;
    }
  }
}
