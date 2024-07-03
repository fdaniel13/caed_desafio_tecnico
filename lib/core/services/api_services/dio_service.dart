import 'package:dio/dio.dart';

import '../../consts/api_routes.dart';
class DioService{

final Dio dio=Dio(
  BaseOptions(
    
      baseUrl:apiBaseUrl
    )
);
}