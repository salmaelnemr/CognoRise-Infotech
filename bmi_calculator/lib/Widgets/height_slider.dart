import 'package:flutter/material.dart';
import 'package:pmi_calculator/Widgets/app_text.dart';

class HeightSlider extends StatelessWidget {
  final double sliderValue;
  final ValueChanged<double> onChanged;

  const HeightSlider({
    required this.sliderValue,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Container(
          padding: const EdgeInsets.only(top: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey,
          ),
          child: Column(
            children: [
              const AppText(
                title: "Height",
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  AppText(
                    title: "${sliderValue.round()}",
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                  const AppText(
                    title: "CM",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              Slider(
                value: sliderValue,
                onChanged: onChanged,
                min: 80,
                max: 220,
                activeColor: const Color(0xFFf97c80),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
