import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sample/model/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final ondeleteitem;
  final ontodochange;

  const TodoItem(
      {Key,
      required this.todo,
      required this.ondeleteitem,
      required this.ontodochange});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          ontodochange(todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.blue,
        leading: Icon(
          todo.isdone! ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.red,
        ),
        title: Text(
          todo.title!,
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              decoration: todo.isdone! ? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          child: IconButton(
            color: Colors.red,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {ondeleteitem(todo.id);},
          ),
        ),
      ),
    );
  }
}
