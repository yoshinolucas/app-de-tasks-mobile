import 'package:flutter/material.dart';
import 'package:myapp/src/ini/initial-screen.dart';
import 'package:myapp/src/models/tasks.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  ChangeNotifierProvider(
  create: (context) => Tasks(tasks: []),
  child: MyApp())
  );

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InitialScreen()
    );
  }
}