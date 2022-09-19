import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rest_api_testing_part_one/User.dart';
import 'package:http/http.dart';
import 'dart:developer';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<void> uploadPost() async{
    String url = "https://reqres.in/api/users";
    Uri uri = Uri.parse(url);

    Map<String,String> map = {
      "email" : "a@gmail.com",
      "first_name" : "a",
      "last_name" : "b",
      "avatar": "https://reqres.in/img/faces/7-image.jpg"
    };

    Response response = await post(uri,body: map);
    log(response.body);
  }
  Future<void> getData() async{
    List<User> list = [];
    String url = "https://reqres.in/api/users?page=2";
    Uri uri = Uri.parse(url);

    Response response = await get(uri);
    //log(response.body);
    Map map = jsonDecode(response.body.toString());
   // log(map.toString());
   // Map<String,dynamic> json = jsonDecode(res.body);
    map['data'].forEach((element){
        list.add(User.fromJson(element));
    });
    log(list[0].first_name.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //uploadPost();
          getData();
        },
        tooltip: 'POST',
        child: const Icon(Icons.add),
      ),
    );
  }
}
