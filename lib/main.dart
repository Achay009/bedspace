import 'package:flutter/material.dart';
import './screens/home.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Squat',
      theme: new ThemeData(
        primaryColor: new Color(0xffECFCFF),
        accentColor: new Color(0xffECFCFF),

      ),
      home: new SquatHome(),
    );
  }
}


