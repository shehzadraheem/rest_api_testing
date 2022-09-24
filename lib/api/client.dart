import 'dart:math';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

Dio client(){
  Dio dio = Dio();

  String apiKey = "";
  dio.options.baseUrl = "https://reqres.in/";
  dio.options.connectTimeout = 10000;

  dio.interceptors.add(InterceptorsWrapper(
       onRequest: (RequestOptions options,handler) => intercepterRequest(options, handler),
       onResponse: (Response response , handler) => intercepterResponse(response, handler),
       onError: (DioError error , handler) => intercepterError(error, handler),
  ));

  return dio;
}

intercepterRequest(RequestOptions options,handler){
  return handler.next(options);
}

intercepterResponse(Response response , handler){
return handler.next(response);
}

intercepterError(DioError error , handler){
  return handler.next(error);
}