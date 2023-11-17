import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];

  final _myBox = Hive.box('mybox');

  //create initial
  void createInitialData() {
    toDoList = [
      ["Make Tutorial", true],
      ["Clean the room"]
    ];
  }

  //load data
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

//update data
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
