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
        primarySwatch: Colors.amber,
      ),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {

          }
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Task('Aprender Flutter'),
            Task('Aprender PHP'),
            Task('Aprender React'),
          ],
        ),
        appBar: AppBar(
          title: const Text('Task Manager', style: TextStyle(color: Colors.white))
        ),
      ),
    );
  }
}


class Task extends StatelessWidget {
  final String titulo;
  const Task(this.titulo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(color: Colors.blue, height: 140,),
          Container(
            color: Colors.white, height: 100, 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.black26,
                  width: 72,
                  height: 100,
                ),
                Text(titulo),
                ElevatedButton(
                  onPressed: (){},
                  child: const Icon(Icons.arrow_drop_up),
                ),
              ],
            )
          ),
        ],
      )
    );
  }
}
