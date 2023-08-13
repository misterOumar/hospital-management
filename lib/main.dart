import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hospital_dashboard/models/patients.dart';
import 'package:hospital_dashboard/screens/main/main_screen.dart';
import 'constants.dart';
import 'models/boxes.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PersonAdapter());
  boxPersonnes = await Hive.openBox<Person>('PatientBox');
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
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
