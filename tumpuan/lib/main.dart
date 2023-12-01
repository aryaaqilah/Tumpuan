import 'package:flutter/material.dart';
import 'package:tumpuan/components/checkBoxSignUp.dart';
import 'login_page.dart';
import 'screens/home.dart';
import 'start_page.dart';
import 'splash_page.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: SplashPage()
    );
  }
}
