import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Fundamentals',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {}),
        body: ListView(
          children: [
            Task('Aprender Flutter'),
            Task('Aprender PHP'),
            Task('Aprender React'),
          ],
        ),
        appBar: AppBar(
            title: const Text('Task Manager',
                style: TextStyle(color: Colors.white))),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String titulo;
  const Task(this.titulo, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  double _levelBar = 0;
  int _nivel = 0;
  int _xp = 0;
  grow() {
    if (_xp == 10) {
      setState(() {
        _nivel++;
      });
      _xp = 0;
      _levelBar = 0;
    } else {
      setState(() {
        _xp++;
        _levelBar += 76;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
            child: Stack(
          children: [
            Container(
              color: Colors.blue,
              height: 140,
            ),
            Column(
              children: [
                Container(
                    color: Colors.white,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: Colors.black26,
                          width: 72,
                          height: 100,
                        ),
                        Container(
                          width: 200,
                          child: Text(
                            widget.titulo,
                            style: TextStyle(
                                fontSize: 24, overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => grow(),
                          child: const Icon(Icons.arrow_drop_up),
                        ),
                      ],
                    )),
                Text('Nível: $_nivel',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                Padding(
                  padding: EdgeInsets.only(left:10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        color: Color.fromARGB(255, 22, 250, 22),
                        width: _levelBar,
                        height: 10,
                      ),       
                    ],
                  ),              
                ),
              ],
            )
          ],
        )));
  }
}
