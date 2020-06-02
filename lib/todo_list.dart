import 'package:flutter/material.dart';
import 'package:todolist/todo.dart';

typedef ToggleTodoCallback = void Function(Todo, bool);

class ToDoList extends StatelessWidget{

  ToDoList({@required this.todos, this.onToDoToggle});
  final List<Todo> todos;
  final ToggleTodoCallback onToDoToggle;

  Widget _buildItem(BuildContext context, int index) {
    final todo = todos[index];

    return CheckboxListTile(
      value: todo.isDone,
      title: Text(todo.title),
      onChanged: (bool isChecked) {
        onToDoToggle(todo, isChecked);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: _buildItem, itemCount: todos.length);
  }
}
