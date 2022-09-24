import 'dart:math';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

Future<Response> fetchAll(Dio dio){
    return dio.get("api/users?page=2");
}

Future<Response> fetch(Dio dio,String id)async{
    Response response = await dio.get("api/users/$id");
    return response;
}

Future<Response> add(Dio dio, Map<String,dynamic> data){
    return dio.post("api/users" , data: data);
}

Future<Response> delete(Dio dio , String id){
    return dio.delete("api/users/$id");
}

Future<Response> update(Dio dio, String id, Map<String,dynamic> data){
    return dio.put("api/users/$id",data: data);
}

