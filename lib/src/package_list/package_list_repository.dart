import 'dart:convert';

import 'package:caed_desafio_tecnico/core/models/package_model.dart';

import '../../core/consts/api_routes.dart';
import '../../core/package_mock.dart';
import '../../core/services/api_services/dio_service.dart';

class PackageListRepository {
  final DioService _dioService;

  PackageListRepository(this._dioService);

  Future<PackageResponse?> getPackages() async {
    try {
      PackageResponse packageResponse =
          PackageResponse.fromJson(jsonDecode(packageMock));
      return packageResponse;
      final response = await _dioService.dio.get(getPackage);

      PackageResponse _packageResponse =
          PackageResponse.fromJson(response.data);
      return _packageResponse;
    } catch (error) {
      print(error);
      return null;
    }
  }
}
