import 'package:flutter/material.dart';
import 'package:quize_app/data/question.dart';
import 'package:quize_app/question_screen.dart';
import 'package:quize_app/first_screen.dart';
import 'package:quize_app/result_screen.dart';

class Quize extends StatefulWidget {
  const Quize({super.key});

  @override
  State<Quize> createState() {
    return _QuizeState();
  }
}

class _QuizeState extends State<Quize> {
  // Widget? activeScreen ;
// this list use to store selected answer string
  List<String> selectedAnswers = [];

  var activeScreen = "start-screen";

  // @override
  // void initState() {
  //   activeScreen = FirstScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = "quize-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == question.length) {
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = FirstScreen(switchScreen);

    if (activeScreen == "quize-screen") {
      screenWidget = QuizeScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == "result-screen") {
      screenWidget = ResultScreen(chosenAnswer: selectedAnswers,);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 78, 13, 151),
            Color.fromARGB(255, 107, 15, 168)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: screenWidget,
        ),
      ),
    );
  }
}
