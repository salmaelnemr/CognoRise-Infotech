import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pmi_calculator/BMI/bmi_result.dart';
import 'package:pmi_calculator/Widgets/app_text.dart';
import '../Widgets/app_app_bar.dart';
import '../Widgets/counter_card.dart';
import '../Widgets/gender_card.dart';
import '../Widgets/height_slider.dart';

class BMIView extends StatefulWidget {
  const BMIView({super.key});

  @override
  State<BMIView> createState() => _BMIViewState();
}

class _BMIViewState extends State<BMIView> {
  double sliderValue = 150;
  int weight = 50;
  int age = 20;
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const AppAppBar(
        backgroundColor: Colors.black,
        title: 'BMI Calculator',
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  GenderCard(
                    icon: Icons.male,
                    label: "MALE",
                    isSelected: isMale,
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                  ),
                  const SizedBox(width: 20),
                  GenderCard(
                    icon: Icons.female,
                    label: "FEMALE",
                    isSelected: !isMale,
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          HeightSlider(
            sliderValue: sliderValue,
            onChanged: (value) {
              setState(() {
                sliderValue = value;
              });
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  CounterCard(
                    label: "WEIGHT",
                    value: weight,
                    onDecrement: () {
                      setState(() {
                        if (weight > 0) weight--;
                      });
                    },
                    onIncrement: () {
                      setState(() {
                        weight++;
                      });
                    },
                  ),
                  const SizedBox(width: 20),
                  CounterCard(
                    label: "AGE",
                    value: age,
                    onDecrement: () {
                      setState(() {
                        if (age > 0) age--;
                      });
                    },
                    onIncrement: () {
                      setState(() {
                        age++;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Container(
              width: 370,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xFFf97c80),
              ),
              child: MaterialButton(
                onPressed: () {
                  var result = weight / pow(sliderValue / 100, 2);
                  String classification;
                  String imageBody;
                  if (result < 18.5) {
                    classification = 'Underweight';
                    imageBody = isMale ? 'assets/images/underWeightBoy.png' : 'assets/images/underWeight.png';
                  } else if (result >= 18.5 && result < 24.9) {
                    classification = 'Normal weight';
                    imageBody = isMale? 'assets/images/normalBoy.png' : 'assets/images/normal.png';
                  } else if (result >= 25 && result < 29.9) {
                    classification = 'Overweight';
                    imageBody = isMale? 'assets/images/overweightBoy.png' : 'assets/images/overweight.png';
                  } else if (result >= 30 && result < 34.9) {
                    classification = 'Obese';
                    imageBody = isMale? 'assets/images/obeseBoy.png' : 'assets/images/obese.png';
                  }else {
                    classification = 'Extremely Obese';
                    imageBody = isMale? 'assets/images/extremeObeseBoy.png' : 'assets/images/extremeObese.png';
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BMIResultView(
                        isMale: isMale,
                        age: age,
                        weight: weight,
                        result: result,
                        classification: classification,
                        imageBody: imageBody,
                      ),
                    ),
                  );
                },
                child: const AppText(
                  title: "Calculate",
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
