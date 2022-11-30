
import 'package:flutter/material.dart';
import '../components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool dark = false;
  icon_dark(dark) {
    var sunny = Icon(Icons.sunny, color: Colors.black);
    var moon = Icon(Icons.dark_mode_rounded);
    if (dark) {
      return sunny;
    } else {
      return moon;
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Fundamentals',
      theme: ThemeData(
        primarySwatch: dark ? Colors.blueGrey : Colors.pink,
      ),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: dark ? Colors.white70 : Color.fromARGB(221, 80, 24, 46),
            onPressed: () {
              setState(() {
                dark = !dark;
              });
            },
            child: icon_dark(dark)),
        backgroundColor: dark
            ? Color.fromARGB(137, 29, 29, 29)
            : Color.fromARGB(255, 241, 241, 241),
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title:
              const Text('Task Manager', style: TextStyle(color: Colors.white)),
        ),
        body: ListView(
          children: [
            Image.asset('assets/img/imagem1.jpg'),
            Task(
                'Aprender Flutter',
                'https://avatars.githubusercontent.com/u/105754882?v=4',
                3,
                dark),
            Task(
                'Aprender PHP',
                'https://avatars.githubusercontent.com/u/105754882?v=4',
                2,
                dark),
            Task(
                'Aprender React',
                'https://avatars.githubusercontent.com/u/105754882?v=4',
                5,
                dark),
            Task(
                'Aprender sei la',
                'https://avatars.githubusercontent.com/u/105754882?v=4',
                1,
                dark),
            Task(
                'Aprender sei la',
                'https://avatars.githubusercontent.com/u/105754882?v=4',
                1,
                dark),
            Task(
                'Aprender sei la',
                'https://avatars.githubusercontent.com/u/105754882?v=4',
                3,
                dark),
            Task(
                'Aprender sei la',
                'https://avatars.githubusercontent.com/u/105754882?v=4',
                4,
                dark),
            Task(
                'Aprender sei la',
                'https://avatars.githubusercontent.com/u/105754882?v=4',
                3,
                dark),
          ],
        ),
      ),
    );
  }
}
