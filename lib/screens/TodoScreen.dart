import 'package:flutter/material.dart';
import 'package:flutter_getx_todo_list/controlers/TodoController.dart';
import 'package:flutter_getx_todo_list/models/Todo.dart';
import 'package:get/get.dart';

class TodoScreen extends StatelessWidget {
  final TodoController todoController = Get.find<TodoController>();
  final int index;
  TodoScreen({this.index});
  @override
  Widget build(BuildContext context) {
    String text = '';
    if (this.index != null) {
      text = todoController.todos[index].text;
    }

    TextEditingController textEditingController =
        TextEditingController(text: text);
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
                    if (this.index == null)
                      todoController.todos
                          .add(Todo(text: textEditingController.text));
                    else {
                      
                      var editing = todoController.todos[index];
                      editing.text = textEditingController.text;
                      todoController.todos[index] = editing;
                    }
                    Get.back();
                  },
                  child: Text((this.index == null) ? 'Add' : 'Edit'),
                  style: ElevatedButton.styleFrom(
                      primary: (this.index == null)
                          ? Theme.of(context).primaryColor
                          : Colors.green[400]),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
