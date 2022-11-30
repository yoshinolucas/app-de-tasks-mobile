import 'package:flutter/material.dart';
import 'difficulty.dart';

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
  int _nivelMaestry = 100;

  List<Color?> _maestry = [Colors.brown[100], Colors.cyan[200], Colors.amber[300]];

  grow(difficulty) {
    if (_levelBar >= 0.99) {
      setState(() {
        _nivel++;
      });
      _levelBar = 0;
    } else {
      setState(() {
        print(_levelBar);
        _levelBar += 0.5 / difficulty;
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
                  color:  _nivel >= 2
                          ? _maestry[2]
                          : _maestry[_nivel],
                  borderRadius: BorderRadius.circular(4)),
              height: 140,
            ),
            Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: widget.dark
                            ? Color.fromARGB(255, 171, 171, 172)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(4)),
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: widget.dark
                              ? Color.fromARGB(255, 171, 171, 172)
                              : Colors.white,
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
                            Difficulty(
                                darkStar: widget.dark,
                                level: widget.difficulty),
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
                                  const Icon(Icons.arrow_drop_up),
                                  const Text('UP',
                                      style: TextStyle(fontSize: 12)),
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
