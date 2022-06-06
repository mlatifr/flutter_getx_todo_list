import 'package:flutter/material.dart';
import 'package:flutter_getx_todo_list/controlers/TodoController.dart';
import 'package:flutter_getx_todo_list/screens/TodoScreen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.put(TodoController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Getx Todo List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            Get.to(TodoScreen());
          },
        ),
      ),
      body: Container(
        child: Obx(() => ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  title: Text(todoController.todos[index].text,
                      style: (todoController.todos[index].done)
                          ? TextStyle(
                              color: Colors.red,
                              decoration: TextDecoration.lineThrough)
                          : TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color)),
                  onTap: () {},
                  leading: Checkbox(
                    value: todoController.todos[index].done,
                    onChanged: (value) {
                      // yang dirubah harus class dari Model Todo nya.
                      // bukan cuma value dari Todo nya saja
                      var changed = todoController.todos[index];
                      changed.done = value;
                      todoController.todos[index] = changed;
                    },
                  ),
                  trailing: Icon(Icons.chevron_right_rounded),
                ),
            separatorBuilder: (_, __) => Divider(),
            itemCount: todoController.todos.length)),
      ),
    );
  }
}
