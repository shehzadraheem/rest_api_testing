import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_rest_api_testing_part_one/api/client.dart';
import 'package:flutter_rest_api_testing_part_one/api/framework_api.dart';

import '../User.dart';
import 'package:logger/logger.dart';
Logger logger = Logger();
/*
 * Basically use to get data from
 * online database, shared preference , sqlite etc
 */
class FrameworkRepository{

  Dio? _apiClient;

  FrameworkRepository(){
    _apiClient = client();
  }

  Future<List<User>> fetchAllUsers() async{
     Response response = await fetchAll(_apiClient!);

     return List<User>.from(
         (response.data).map((json) => User.fromJson(json))
     );
  }

  Future<User> fetchSingleUser() async{
    Response response = await fetch(_apiClient!, "2");
    logger.d(response.data);
    return User.fromJson(response.data);
  }

  Future<Response> deleteUser() async{
    Response response = await delete(_apiClient!, "2");
    return response;
  }

  Future<Response> updateUser(User user) async{
    Response response = await update(_apiClient!, "2", user.toJson());
    return response;
  }

  Future<User> addUser(User user) async{
    Response response = await add(_apiClient!, user.toJson());
    return User.fromJson(response.data);
  }


}