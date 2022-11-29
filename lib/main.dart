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
      home: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                color: Colors.red,
                width: 100,
                height: 100,
              ),
              Container(
                color: Colors.blue,
                width: 50,
                height: 50,
              )
            ],
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                color: Colors.red,
                width: 100,
                height: 100,
              ),
              Container(
                color: Colors.blue,
                width: 50,
                height: 50,
              )
            ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.cyan,
                  width: 100,
                  height: 100,
                ),
                Container(
                  color: Colors.purple,
                  width: 100,
                  height: 100,
                )
              ]),
          Container(
            color: Colors.amber,
            height: 30,
            width: 300,
            child: const Text(
              'Olá Mundo!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black, fontSize: 28
                ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              print('Botão Apertado');
            },
            child: const Text(
              'Aperte o botão!'
            ),
          ),
        ],
      ),
    );
  }
}
