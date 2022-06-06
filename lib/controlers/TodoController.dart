import 'package:flutter_getx_todo_list/models/Todo.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TodoController extends GetxController {
  var todos = List<Todo>().obs;

  @override
  void onInit() {
    List storedTodos = GetStorage().read<List>('todos');
    if (storedTodos != null) {
      todos = storedTodos.map((e) => Todo.fromJson(e)).toList().obs;
    }
    ever(todos, (_) {
      GetStorage().write('todos', todos.toList());
    });
    super.onInit();
  }
}
