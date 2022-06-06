import 'package:flutter/material.dart';
import 'package:flutter_getx_todo_list/screens/HomeScreen.dart';
import 'package:flutter_getx_todo_list/screens/TodoScreen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() {
  GetStorage.init();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}
