import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function (bool?)? onChanged;
  Function(BuildContext)?deleteFunction;

  ToDoTile({
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,


});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25,right: 25,left: 25),
      child:Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
                onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade800,
            )

          ],
        ),

        child:Container(
            padding: EdgeInsets.all(15),
            child: Row(children: [
              //checkbox
              Checkbox(value: taskCompleted,
                       onChanged: onChanged,
                       checkColor: Colors.yellow.shade500,
                       activeColor: Colors.yellow.shade200,),

              //tasks
              Text(taskName,
                   style: TextStyle(
                        decoration: taskCompleted?TextDecoration.lineThrough:TextDecoration.none,
                        fontSize: 20),),
            ]),
            decoration: BoxDecoration(
                color: Colors.yellow.shade600,
                borderRadius: BorderRadius.circular(12))),)
      );

  }
}
