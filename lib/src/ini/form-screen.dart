import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/task.dart';
import '../models/tasks.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key, required this.taskContext}) : super(key: key);

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imgController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.pink),
      home: Form(
        key: _formKey,
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 241, 241, 241),
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back)),
            title: const Text('New Task'),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                height: 650,
                width: 375,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 250, 212, 223),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 1.5,
                        color: Color.fromARGB(66, 238, 221, 221))),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFormField(
                        validator: (String? value) {
                          return value!.isEmpty ? 'Insira um título' : null;
                        },
                        controller: titleController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Title',
                            fillColor: Colors.white70,
                            filled: true),
                      ),
                      TextFormField(
                        validator: (String? value) {
                          return value!.isEmpty ||
                                  int.parse(value) > 5 ||
                                  int.parse(value) < 1
                              ? 'Insira uma dificuldade entre 1 e 5'
                              : null;
                        },
                        keyboardType: TextInputType.number,
                        controller: difficultyController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Difficulty: 1 - 5',
                            fillColor: Colors.white70,
                            filled: true),
                      ),
                      TextFormField(
                        validator: (String? value) {
                          return value!.isEmpty
                              ? 'Insira uma url válida'
                              : null;
                        },
                        keyboardType: TextInputType.url,
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
                            border:
                                Border.all(width: 1.5, color: Colors.pink),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(imgController.text,
                                errorBuilder: (BuildContext context,
                                    Object exception,
                                    StackTrace? stackTrace) {
                              return Image.asset(
                                  '../../../assets/icons/nophoto.png');
                            }, fit: BoxFit.cover),
                          )),
                      Consumer<Tasks>(
                        builder: (BuildContext context, Tasks list, Widget? widget) {
                          return ElevatedButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(16))),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                  list.tasks.add(Task(
                                    titleController.text,
                                    imgController.text,
                                    int.parse(difficultyController.text),
                                    false));
                                Navigator.pop(context);
                              };
                            },
                            child: Text(
                              'Salvar',
                              style: TextStyle(fontSize: 24),
                            ),
                          ); 
                        }
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      )  
    );
  }
}
