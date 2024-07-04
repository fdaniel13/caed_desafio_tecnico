import 'package:caed_desafio_tecnico/core/services/local_data_service/shared_preferences_service.dart';
import 'package:dio/dio.dart';

import '../../consts/api_routes.dart';

class DioInterceptors extends Interceptor{

 
 
 @override
 void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
  SharedPreferencesService sharedPreferencesService=SharedPreferencesService();
   String? key =  await  sharedPreferencesService.readAcessKey();
   if(options.path!=apiSignIn && key!=null){
   options.headers["Authorization"]="Bearer $key";
   }
    super.onRequest(options, handler);
  }
  @override
void onError(DioException err, ErrorInterceptorHandler handler) {
   
    super.onError(err, handler);
  }
  @override
void onResponse(Response response, ResponseInterceptorHandler handler) {
    
    super.onResponse(response, handler);
  }

}