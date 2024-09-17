import 'package:flutter/material.dart';
import '../Widgets/app_app_bar.dart';

class BMIResultView extends StatelessWidget {
  const BMIResultView({
    super.key,
    required this.isMale,
    required this.age,
    required this.weight,
    required this.result,
    required this.classification,
    required this.imageBody,
  });

  final bool isMale;
  final double result;
  final int age;
  final int weight;
  final String classification;
  final String imageBody;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const AppAppBar(
        backgroundColor: Colors.black,
        title: 'BMI Result',
        enableBackButton: true,
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              imageBody,
            ),
            Text(
              "Gender: ${isMale == true ? "Male" : "Female"}",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "Age: $age",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "Weight: $weight",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "Result: ${result.round()}",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "Classification: $classification",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
