import 'package:flutter/material.dart';
import 'package:flutter_getx_todo_list/controlers/TodoController.dart';
import 'package:flutter_getx_todo_list/models/Todo.dart';
import 'package:get/get.dart';

class TodoScreen extends StatelessWidget {
  final TodoController todoController = Get.find<TodoController>();
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: textEditingController,
                autofocus: true,
                decoration: InputDecoration(
                    hintText: 'apa yg akan kamu lakukan?',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none),
                style: TextStyle(fontSize: 25),
                keyboardType: TextInputType.multiline,
                maxLines: 999,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('Cancel'),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                ),
                ElevatedButton(
                  onPressed: () {
                    todoController.todos
                        .add(Todo(text: textEditingController.text));
                    Get.back();
                  },
                  child: Text('Add'),
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
