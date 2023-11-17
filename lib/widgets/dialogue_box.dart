import 'package:flutter/material.dart';

import 'button.dart';


class DialogueBox extends StatelessWidget {
  final controller;
  VoidCallback onsave;
  VoidCallback oncancel;


  DialogueBox({
    required this.controller,
    required this.onsave,
    required this.oncancel

});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow.shade300,
      content: Container(
        width: 120,
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Text field
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(text: "Add", onPressed: (){onsave();}),
                SizedBox(width: 5,),

                Button(text: "Cancel", onPressed: (){
                  oncancel();
                },),
              ],
            ),

            //buttons
          ],
        ),
      ),
    );
  }
}
