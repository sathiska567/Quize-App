import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen(this.startQuize, {super.key});

  final void Function() startQuize;

  // final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child:

          // image container
          Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.5,
            child: Container(
                child: Image.asset('assets/images/quiz-logo.png', width: 200)),
          ),

          const SizedBox(
            height: 30,
          ),

          //  text container
          Center(
            child: Container(
              child: const Text(
                "Learn Flutter The Fun Way",
                style: TextStyle(
                    color: Color.fromARGB(255, 237, 223, 252),
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                    
                    ),
              ),
            ),
          ),

          const SizedBox(height: 30),

          //  button container
          Container(
            child: OutlinedButton.icon(
                onPressed: startQuize,
                style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
                icon: const Icon(Icons.arrow_right_alt),
                label: const Text("Start Quize")),
          )
        ],
      )),
    );
  }
}
