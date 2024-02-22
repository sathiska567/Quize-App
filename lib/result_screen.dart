import 'package:flutter/material.dart';
import 'package:quize_app/data/question.dart';
import 'package:quize_app/first_screen.dart';
import 'package:quize_app/question_summery.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key, required this.chosenAnswer}) : super(key: key);

  final List<String> chosenAnswer;

  List<Map<String, Object>> getSummeryData() {
    final List<Map<String, Object>> summery = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summery.add({
        "question_index": i,
        "question": question[i].text,
        "correct_answer": question[i].answer[0],
        "user_answer": chosenAnswer[i],
      });
    }

    return summery;
  }

  @override
  Widget build(BuildContext context) {
    final summeryData = getSummeryData();
    final numberOfQuestions = question.length;
    final numberOfCorrectAnswers = summeryData.where((data) {
      return data["user_answer"] == data["correct_answer"];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: Text(
              "You answered $numberOfCorrectAnswers out of $numberOfQuestions questions correctly!",
              style: TextStyle(
                color: Colors.green[400],
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            )),
            // const SizedBox(height: 20),
            QuestionSummery(summeryData), // Pass the key if needed
            const SizedBox(height: 40),
            // TextButton(
            //     onPressed:,
            //     child: const Text("Restart Quiz..."))
          ],
        ),
      ),
    );
  }
}
