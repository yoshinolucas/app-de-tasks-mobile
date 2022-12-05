import 'package:flutter/cupertino.dart';

import '../components/task.dart';

class Tasks extends ChangeNotifier {
  List<Task> tasks;
  List<Task> get _tasks => tasks;

  Tasks({required this.tasks});

  void add(Task task) {
    tasks.add(task);
    notifyListeners();
  }
}
