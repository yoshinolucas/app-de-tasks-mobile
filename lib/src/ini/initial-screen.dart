import 'package:flutter/material.dart';
import 'package:myapp/src/ini/form-screen.dart';
import 'package:myapp/src/services/task_inherited.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool dark = false;
  icon_dark(dark) {
    var sunny = Icon(Icons.sunny, color: Colors.white);
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
      title: 'My Tasks',
      theme: ThemeData(
        primarySwatch: dark ? Colors.blueGrey : Colors.pink,
      ),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: dark
                ? Color.fromARGB(179, 0, 0, 0)
                : Color.fromARGB(221, 209, 0, 84),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (contextNew) => FormScreen(taskContext: context)
                ),
              );
            },
            child: Icon(Icons.add)),
        backgroundColor: dark
            ? Color.fromARGB(137, 29, 29, 29)
            : Color.fromARGB(255, 241, 241, 241),
        appBar: AppBar(
          actions: <Widget>[
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: dark
                      ? MaterialStateProperty.all(
                          Color.fromARGB(95, 233, 223, 223))
                      : MaterialStateProperty.all(Colors.pink[700]),
                ),
                child: icon_dark(dark),
                onPressed: () {
                  setState(() {
                    dark = !dark;
                  });
                }),
          ],
          leading: Icon(Icons.menu),
          title:
              const Text('Task Manager', style: TextStyle(color: Colors.white)),
        ),
        body: ListView(children: 
            [ 
              Image.asset('assets/img/imagem1.jpg'),
              // aqui voce pede o método que pede um contexto e retorna esse objeto
              ...(TaskInherited.of(context)?.tasks ?? [Text('Nenhuma tarefa encontrada')])
            ]
          ),
        ),
      );
  }
}
