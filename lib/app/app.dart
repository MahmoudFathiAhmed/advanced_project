import 'package:advanced_project/presentation/theme_manger.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
//named constructor
  MyApp._internal();
  static final MyApp _instance = MyApp._internal(); //singleton or single instance
  factory MyApp()=> _instance; //factory
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getApplicationTheme(),
    );
  }
}