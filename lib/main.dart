
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:clock_app/clockScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ClockScreen(),
    );
  }

}

