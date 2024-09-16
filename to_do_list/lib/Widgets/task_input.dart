import 'package:flutter/material.dart';

class TaskInput extends StatelessWidget {
  final TextEditingController taskController;
  final VoidCallback onAddTask;

  const TaskInput({
    required this.taskController,
    required this.onAddTask,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: taskController,
              cursorColor: Colors.brown,
              decoration: const InputDecoration(
                labelText: 'Enter a task',
                labelStyle: TextStyle(
                  color: Colors.brown,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.brown,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.brown,
                  ),
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            height: 57,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.brown,
            ),
            child: TextButton(
              onPressed: onAddTask,
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
