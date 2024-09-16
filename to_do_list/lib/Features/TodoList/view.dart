import 'package:flutter/material.dart';
import '../../Widgets/app_app_bar.dart';
import '../../Widgets/task_input.dart';
import '../../Widgets/task_list.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {

  List<String> tasks = [];
  TextEditingController taskController = TextEditingController();

  void addTask() {
    setState(() {
      if (taskController.text.isNotEmpty) {
        tasks.add(taskController.text);
        taskController.clear();
      }
    });
  }

  void removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E3),
      appBar: const AppAppBar(
        backgroundColor: Colors.brown,
        title: "TO-DO LIST",
      ),
      body: Column(
        children: [
          TaskInput(
            taskController: taskController,
            onAddTask: addTask,
          ),
          TaskList(
            tasks: tasks,
            onRemoveTask: removeTask,
          ),
        ],
      ),
    );
  }
}
