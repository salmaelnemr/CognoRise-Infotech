import 'dart:async';
import 'package:flutter/material.dart';
import 'package:to_do_list/Features/TodoList/view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    Timer(const Duration(seconds: 4), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TodoList(),),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFAF5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/to_do_list.png',
              height: 350,
              width: 400,
            ),
            const Text(
              "To Do List",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w400,
                color: Colors.brown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

