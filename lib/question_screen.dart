import "package:flutter/material.dart";
import "package:quize_app/answer_button.dart";
import "package:quize_app/data/question.dart";

class QuizeScreen extends StatefulWidget {
  const QuizeScreen({super.key,required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuizeScreen> createState() {
    return _QuizeScreen();
  }
}

class _QuizeScreen extends State<QuizeScreen> {
// this variable used to store current question index
  var currentQuestionIndex = 0;

// this function used to increment current index value
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);

    setState(() {
      currentQuestionIndex++;
    });

  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = question[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            // Map the data file data    {... these three dots are used to get individual value in comma separated list}
            // this map use to genarate data without hardcode
            ...currentQuestion.getShuffleAnswer().map((answer) {
              return AnswerButton(
                  text: answer,
                  onTap: () {
                    answerQuestion(answer);
                  });
            })

            // AnswerButton(text: "Answer 04", onTap: () {})
          ],
        ),
      ),
    );
  }
}
