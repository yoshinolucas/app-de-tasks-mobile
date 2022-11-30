import 'package:flutter/material.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Fundamentals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 241, 241, 241),
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: const Text('Task Manager',
              style: TextStyle(color: Colors.white)
          ),
        ),
        body: ListView(
          children: [
            Image.asset('assets/img/imagem1.jpg'),
            Task('Aprender Flutter'),
            Task('Aprender PHP'),
            Task('Aprender React'),
            Task('Aprender sei la'),
            Task('Aprender sei la'),
            Task('Aprender sei la'),
            Task('Aprender sei la'),
            Task('Aprender sei la'),
          ],
        ),
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
      setState(() {_nivel++;});
      _xp = 0;
      _levelBar = 0;
    } else {
      setState(() {
        _xp++;
        _levelBar += 0.1;});
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
              color: Colors.pink,
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
                              fontSize: 24, 
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:12.0),
                        child: SizedBox(
                          width: 52,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: () => grow(),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(Icons.arrow_drop_up),
                                Text('UP', style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12, top: 9.5),
                      child: SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.white70,
                          color: Colors.white,
                          value: _levelBar,               
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 9.5),
                      child: Text(
                        'Nível: $_nivel',
                        style: TextStyle(color: Colors.white, fontSize: 16)
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        )
      )
    );
  }
}
