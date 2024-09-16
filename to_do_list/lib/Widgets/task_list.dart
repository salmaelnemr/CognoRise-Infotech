import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TaskList extends StatelessWidget {
  final List<String> tasks;
  final Function(int) onRemoveTask;

  const TaskList({
    required this.tasks,
    required this.onRemoveTask,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(tasks[index]),
            onDismissed: (direction) {
              onRemoveTask(index);
            },
            background: Container(
              color: Colors.red,
              child: const Icon(
                FontAwesomeIcons.trash,
                color: Colors.white,
                size: 30,
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 380,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.brown,
                  ),
                  child: ListTile(
                    title: Center(
                      child: Text(
                        tasks[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
