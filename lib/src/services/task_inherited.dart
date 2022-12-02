import 'package:flutter/material.dart';
import 'package:myapp/src/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({Key? key, required this.child})
      : super(key: key, child: child);

  final List<Task> tasks = [
    Task('Aprender Flutter',
        'https://avatars.githubusercontent.com/u/105754882?v=4', 3, false),
    Task('Aprender PHP',
        'https://avatars.githubusercontent.com/u/105754882?v=4', 2, false),
    Task('Aprender React',
        'https://avatars.githubusercontent.com/u/105754882?v=4', 5, false),
    Task('Aprender sei la',
        'https://avatars.githubusercontent.com/u/105754882?v=4', 1, false),
    Task('Aprender sei la',
        'https://avatars.githubusercontent.com/u/105754882?v=4', 1, false),
    Task('Aprender sei la',
        'https://avatars.githubusercontent.com/u/105754882?v=4', 3, false),
    Task('Aprender sei la',
        'https://avatars.githubusercontent.com/u/105754882?v=4', 4, false),
    Task('Aprender sei la',
        'https://avatars.githubusercontent.com/u/105754882?v=4', 3, false),
  ];

  void newTask(String title, String photo, int difficulty, bool dark) {
    tasks.add(Task(title, photo, difficulty, dark));
  }

  final Widget child;

  static TaskInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskInherited>();
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.tasks.length != tasks.length;
  }
}
