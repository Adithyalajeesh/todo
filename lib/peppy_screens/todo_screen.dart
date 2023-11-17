import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../data/database.dart';
import '../widgets/todotile.dart';


class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  //reference the hive box
  final _myBox=Hive.box('mybox');
  ToDoDatabase db=ToDoDatabase();

  @override
  void initState() {
    if(_myBox.get("TODOLIST")==null){
      db.createInitialData();
    }
    else{
      db.loadData();
    }
    super.initState();
  }



  //text controller
  final _controller=TextEditingController();

//checkbox clicked
  void checkBoxChanged(bool? value, int index) {
    if (index >= 0 && index < db.toDoList.length) {
      setState(() {
        db.toDoList[index][1] = !(db.toDoList[index][1] ?? false);
      });
      db.updateDataBase();
    } else {
      print('Invalid index: $index');
    }
  }


  //save new task
  void saveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }
//create tasks
  void createTask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        db.toDoList.add([_controller.text, false]);
        _controller.clear();
      });
      Navigator.of(context).pop();
      db.updateDataBase();
    }
  }

  //delete task
  void deletetask(int index) {
    if (index >= 0 && index < db.toDoList.length) {
      setState(() {
        db.toDoList.removeAt(index);
      });
      db.updateDataBase();
    } else {
      print('Invalid index: $index');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.yellow.shade200,
          title: Text(
            "PeppyDo",
            style: TextStyle(color: Colors.black,fontSize: 30,fontStyle: FontStyle.italic ),
            textAlign: TextAlign.center,
          ),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow.shade600,
          onPressed: (){
            createTask();

          },
          child: Icon(Icons.add),
        ),
        body: Center(
          child: Container(
            color: Colors.yellow.shade200,
            child: ListView.builder(
              itemCount: db.toDoList.length,
              itemBuilder: (context, index) {
                if (index < 0 || index >= db.toDoList.length) {
                  print('Invalid index: $index');
                  return Container(); // Return an empty container
                }

                return ToDoTile(
                  taskName: db.toDoList[index][0],
                  taskCompleted: db.toDoList[index][1],
                  onChanged: (value) => checkBoxChanged(value, index),
                  deleteFunction: (context) => deletetask(index),
                );
              },
            ),

          ),
        ));
  }
}
