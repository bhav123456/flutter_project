import 'package:flutter/material.dart';
import 'package:sample/model/todo.dart';

import '../UI widget/widget.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});
  final String title;
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Todolist = Todo.Todolist();
  List<Todo> foundtodo = [];
  final _todocontroller = TextEditingController();
  //text editing class

  @override
  void initState() {
    foundtodo = Todolist;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(children: [
            Searchbox(),
            Expanded(
                child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50, bottom: 20),
                  child: Text(
                    "All Todos",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                ),
                for (Todo todos in foundtodo.reversed)
                  TodoItem(
                    todo: todos,
                    ondeleteitem: _deleteTodo,
                    ontodochange: _handleToChange,
                  )
              ],
            ))
          ]),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextField(
                    controller: _todocontroller,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20, right: 20),
                child: ElevatedButton(onPressed: () {_addTodoitem(_todocontroller.text);}, child: Text('+')),
              )
            ],
          ),
        ),
      ]),
      appBar: myappbar(),
    );
  }

  void _addTodoitem(String todo){
    setState(() {
      Todolist.add(Todo(id: DateTime.now().millisecondsSinceEpoch.toString(), title: todo));
    });
    _todocontroller.clear();
  }

  void _runfilter(searchtext) {
    List<Todo> results = [];
    if (searchtext.isEmpty) {
      results = Todolist;
    } else {
      results = Todolist.where((element) =>
              element.title!.toLowerCase().contains(searchtext.toLowerCase()))
          .toList();
    }
    setState(() {
      foundtodo = results;
    });
  }

  void _handleToChange(Todo todo){
    setState(() {
       todo.isdone=!todo.isdone!;
    });
   
  }

  void _deleteTodo(String id){
    setState(() {
      Todolist.removeWhere((element) => element.id==id);
    });
    
  }

  AppBar myappbar() {
    return AppBar(backgroundColor: Colors.purple, title: Text("My todo app"));
  }

  Widget Searchbox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Color.fromARGB(207, 219, 153, 153),
          borderRadius: BorderRadius.circular(20)),
      child: TextField(
        onChanged: (value) => _runfilter(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              size: 20,
            ),
            hintText: "search"),
      ),
    );
  }
}
