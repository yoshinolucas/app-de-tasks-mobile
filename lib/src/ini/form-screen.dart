import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imgController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.pink),
        home: Scaffold(
        backgroundColor: Color.fromARGB(255, 241, 241, 241),
        appBar: AppBar(
          leading: Icon(Icons.u_turn_left),
          title: const Text('New Task'),
        ),
        body: Center(
          child: Container(
            height: 650,
            width: 375,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 250, 212, 223),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    width: 1.5, color: Color.fromARGB(66, 238, 221, 221))),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    controller: titleController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Title',
                        fillColor: Colors.white70,
                        filled: true),
                  ),
                  TextFormField(
                    controller: difficultyController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Difficulty',
                        fillColor: Colors.white70,
                        filled: true),
                  ),
                  TextFormField(
                    onChanged: (url) {
                      setState(() {});
                    },
                    controller: imgController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Image',
                        fillColor: Colors.white70,
                        filled: true),
                  ),
                  Container(
                      height: 100,
                      width: 72,
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1.5, color: Colors.pink),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(imgController.text,
                        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                            return Image.asset('../../../assets/icons/nophoto.png');
                        },
                        fit: BoxFit.cover
                        ),
                      )
                    ),
                  ElevatedButton(
                    style: ButtonStyle(
                        padding:
                            MaterialStateProperty.all(EdgeInsets.all(16))),
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text(
                      'Salvar',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
