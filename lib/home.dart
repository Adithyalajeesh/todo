import 'package:flutter/material.dart';
import 'package:peppyyy_do/peppy_screens/todo_screen.dart';

import 'assets.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(
            builder: (context) => Scaffold(
                  body: Stack(
                    children: [
                      //bg image
                      Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(screen),
                                  fit: BoxFit.cover)),
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ToDoScreen()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.yellow.shade600,
                                      minimumSize: Size(150, 50)),
                                  child: Text(
                                    'Get Started',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ))),
                      Padding(
                        padding: EdgeInsets.all(60),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              children: [
                                Text(
                                  "Welcome to PeppyDo",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Let's turn those to-dos into ta-das! ",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 13),
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                )));
  }
}
