import 'package:flutter/material.dart';
import '../../Widgets/app_app_bar.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  String input = "0";
  String output = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        backgroundColor: Colors.orange,
        title: "Calculator",
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 34, horizontal: 24),
            child: Text(
              input,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          const Expanded(child: Divider()),
          Column(
            children: [
              Row(
                children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("÷"),
                ],
              ),
              Row(
                children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("×"),
                ],
              ),
              Row(
                children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-"),
                ],
              ),
              Row(
                children: [
                  buildButton("."),
                  buildButton("0"),
                  buildButton("00"),
                  buildButton("+"),
                ],
              ),
              Row(
                children: [
                  buildButton("CLEAR"),
                  buildButton("="),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "×" || buttonText == "÷") {
      num1 = double.parse(input);
      operand = buttonText;
      output = "0";
    } else if (buttonText == ".") {
      if (!output.contains(".")) {
        output = output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(input);
      if (operand == "+") {
        output = (num1 + num2).toString();
      } else if (operand == "-") {
        output = (num1 - num2).toString();
      } else if (operand == "×") {
        output = (num1 * num2).toString();
      } else if (operand == "÷") {
        output = (num1 / num2).toString();
      }
      num1 = 0;
      num2 = 0;
      operand = "";
    } else {
      output = output + buttonText;
    }

    setState(() {
      input = double.parse(output).toStringAsFixed(2).replaceAll(".00", "");
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.orange,
            ),
          ),
          onPressed: () => buttonPressed(buttonText),
        ),
      ),
    );
  }
}
