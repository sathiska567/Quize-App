import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  // const AnswerButton(this.text,this.onTap ,{super.key});
  const AnswerButton({super.key ,required this.text,required this.onTap});

  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
          
          onPressed:onTap,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal:40,vertical:10 ),
            backgroundColor: const Color.fromARGB(255,33,1,95),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))
          ),
          child: Text(text,textAlign: TextAlign.center,)),
    );
  }
}
