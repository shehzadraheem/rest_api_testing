import 'package:flutter/material.dart';
import 'package:flutter_rest_api_testing_part_one/User.dart';
import 'package:flutter_rest_api_testing_part_one/controller/user_controller.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  var controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ElevatedButton(
            onPressed: () async{
              User user = await controller.getUser();
             // logger.d(user.last_name);
            },
            child: Text('Fetch'),
          ),
        ),
      ),
    );
  }
}
