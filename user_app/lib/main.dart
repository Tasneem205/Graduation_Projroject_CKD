import 'package:flutter/material.dart';
import 'package:graduation_project/pages/Edit%20Profile.dart';
import 'package:graduation_project/pages/home.dart';
import 'package:graduation_project/pages/login.dart';
import 'package:graduation_project/pages/logo.dart';
import 'package:graduation_project/pages/profile.dart';
import 'package:graduation_project/pages/water.dart';
import 'package:graduation_project/pages/Pressure.dart';
import 'package:graduation_project/pages/Diabetes.dart';
import 'package:graduation_project/pages/Walking.dart';
import 'package:graduation_project/pages/medicine.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Logo(),
        '/login': (context) => const Login(),
        '/home': (context) => const Home(),
        '/water': (context) => const Water(),
        '/Pressure': (context) => const Pressure(),
        '/Diabetes': (context) => const Diabetes(),
        '/Walking': (context) => const Walking(),
        '/medicine': (context) => const Medicine(),
        '/profile': (context) => const Profile(),
        '/Edie Profile': (context) => const EditProfile(),

      },
    );
  }
}
