import 'package:flutter/material.dart';
import 'package:hospital_dashboard/screens/main/main_screen.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hospital Admin Panel',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: bgColor,
        canvasColor: secondaryColor,
      ),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
