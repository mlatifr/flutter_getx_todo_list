import 'package:flutter/material.dart';
import 'package:flutter_getx_todo_list/screens/HomeScreen.dart';
import 'package:flutter_getx_todo_list/screens/TodoScreen.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}
