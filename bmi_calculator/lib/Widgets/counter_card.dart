import 'package:flutter/material.dart';
import 'package:pmi_calculator/Widgets/app_text.dart';

class CounterCard extends StatelessWidget {
  final String label;
  final int value;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  const CounterCard({
    required this.label,
    required this.value,
    required this.onDecrement,
    required this.onIncrement,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              title: label,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            AppText(
              title: "$value",
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: onDecrement,
                  mini: true,
                  heroTag: "$label--",
                  child: const Icon(Icons.remove, color: Color(0xFFf97c80)),
                ),
                FloatingActionButton(
                  onPressed: onIncrement,
                  mini: true,
                  heroTag: "$label++",
                  child: const Icon(Icons.add, color: Color(0xFFf97c80)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
