import 'package:caed_desafio_tecnico/core/services/api_services/dio_interceptors.dart';
import 'package:dio/dio.dart';

import '../../consts/api_routes.dart';
class DioService{

final Dio dio=Dio(
  BaseOptions(
    
      baseUrl:apiBaseUrl
    )
)..interceptors.add(DioInterceptors());
}