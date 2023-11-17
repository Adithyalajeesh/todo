import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'home.dart';



void main() async {
  try {
    //initialize hive
    await Hive.initFlutter();

    //open a box
    var box = await Hive.openBox('mybox');
    runApp(MyApp());
  }catch (e) {
    print('Error initializing Hive: $e');
  }
}


