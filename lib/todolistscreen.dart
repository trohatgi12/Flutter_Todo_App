import 'package:flutter/material.dart';
import 'package:todolist/new_todo_dialog.dart';
import 'package:todolist/todo.dart';
import 'package:todolist/todo_list.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Todo> todos = [];

  _toggleTodo(Todo todo, bool isChecked) {
    setState(() {
      todo.isDone = isChecked;
    });
  }

  _addToDo() async {
    final todo = await showDialog<Todo>(
      context: context,
      builder: (BuildContext context) {
        return NewDialogBox();
      },
    );
    if (todo != null) {
      setState(() {
        todos.add(todo);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Todo List'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.help),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute<Null>(
                    builder: (BuildContext context)
                    {
                      return _aboutPage();
                    }));
              },
            ),
          ],
        ),
        body: ToDoList(
          todos: todos,
          onToDoToggle: _toggleTodo,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _addToDo,
        ));
  }

  _aboutPage() {
    return AlertDialog(
      title: Text("About this App"),
      content:
          Text("This app was developed by Tanay, who is a beginner in Flutter"),
      actions: <Widget>[
        FlatButton(
          child: Text("Close"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
