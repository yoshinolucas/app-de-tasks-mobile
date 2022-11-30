import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool dark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Fundamentals',
      theme: ThemeData(
        primarySwatch: dark ? Colors.blueGrey : Colors.pink,
      ),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                dark = !dark;
              });
            },
            child: Icon(Icons.sunny)),
        backgroundColor:
            dark ? Color.fromARGB(137, 29, 29, 29) : Color.fromARGB(255, 241, 241, 241),
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

class Task extends StatefulWidget {
  final String img;
  final String titulo;
  final int difficulty;
  final bool dark;
  const Task(this.titulo, this.img, this.difficulty, this.dark, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  double _levelBar = 0;
  int _nivel = 0;

  grow(difficulty) {
    if (_levelBar >= 0.99) {
      setState(() {
        _nivel++;
      });
      _levelBar = 0;
    } else {
      setState(() {
        print(_levelBar);
        _levelBar += 0.1 / difficulty;
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
              decoration: BoxDecoration(
                  color: widget.dark ? Color.fromARGB(255, 83, 83, 83) : Colors.pink,
                  borderRadius: BorderRadius.circular(4)),
              height: 140,
            ),
            Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: widget.dark ?Color.fromARGB(255, 171, 171, 172):Colors.white,
                        borderRadius: BorderRadius.circular(4)),
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: widget.dark ?Color.fromARGB(255, 171, 171, 172):Colors.white,
                          width: 72,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.network(widget.img, fit: BoxFit.cover),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 200,
                              child: Text(
                                widget.titulo,
                                style: TextStyle(
                                    fontSize: 24,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.star,
                                    size: 12,
                                    color: widget.difficulty >= 1
                                        ? Colors.pink
                                        : Colors.pink[100]),
                                Icon(Icons.star,
                                    size: 12,
                                    color: widget.difficulty >= 2
                                        ? Colors.pink
                                        : Colors.pink[100]),
                                Icon(Icons.star,
                                    size: 12,
                                    color: widget.difficulty >= 3
                                        ? Colors.pink
                                        : Colors.pink[100]),
                                Icon(Icons.star,
                                    size: 12,
                                    color: widget.difficulty >= 4
                                        ? Colors.pink
                                        : Colors.pink[100]),
                                Icon(Icons.star,
                                    size: 12,
                                    color: widget.difficulty == 5
                                        ? Colors.pink
                                        : Colors.pink[100]),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: SizedBox(
                            width: 52,
                            height: 52,
                            child: ElevatedButton(
                              onPressed: () => grow(widget.difficulty),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12, top: 9.5),
                      child: SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.white38,
                          color: Colors.white,
                          value: _levelBar,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 9.5),
                      child: Text('Nível: $_nivel',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ],
                ),
              ],
            ),
          ],
        )));
  }
}
