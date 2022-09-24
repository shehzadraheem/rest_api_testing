import 'package:flutter_rest_api_testing_part_one/repository/framework_repository.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:dio/dio.dart';
import '../User.dart';
import 'package:get/instance_manager.dart';
import 'package:logger/logger.dart';
Logger logger = Logger();

class UserController extends GetxController{

  List<User> users = [];
  // it should be user repository
  FrameworkRepository repository = FrameworkRepository();

  static UserController get to => Get.find<UserController>();

  Future<List<User>> fetchAllUsers() async{
    users = await repository.fetchAllUsers();
    update();
    return users;
  }

  Future<User> getUser() async{
    User user = await repository.fetchSingleUser();
    logger.d(user.email);
    return user;
  }

  Future<void> addUser() async{
    User user = User(
      email: "ok@ok.com",
      first_name: "ok",
      last_name: "gg"
    );
    users.add(await repository.addUser(user));
    update();
  }

  Future<Response> deleteUser() async{
    Response response = await repository.deleteUser();
    return response;
  }

}