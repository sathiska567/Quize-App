import 'package:flutter/material.dart';
// import 'package:quize_app/data/question.dart';

class QuestionSummery extends StatelessWidget {
  const QuestionSummery(this.summeryData, {super.key});

  final List<Map<String, Object>> summeryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
            children: summeryData.map((data) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding:const EdgeInsets.all(5),
                
                child: Container(
                  child: Text(
                  ((data['question_index'] as int) + 1).toString(),
                  style:const TextStyle(color: Colors.white),
                   
                  ),
                )),
        
            Expanded(
              
                child: Container(
                  margin:const EdgeInsets.only(top: 110),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                   children: [
                    Container(
                      padding:const EdgeInsets.all(10),
                      child: Text((data['question'] as String),style: const TextStyle(color: Colors.white,fontSize:15),textAlign: TextAlign.center,)
                      ),
                             
                    Container(
                      padding:const EdgeInsets.all(10),
                      margin:const EdgeInsets.only(top: 20),
                      color: Colors.red,
                      child: Text((data['user_answer'] as String),textAlign: TextAlign.left,)                     
                      ),

                    Container(
                      padding:const EdgeInsets.all(10),
                      margin:const EdgeInsets.only(top: 20),
                      color: Colors.green,
                      child: Text(
                        data['correct_answer'].toString()
                        
                        )),

                   ],
                                ),
                ))
            ],
          );
        }).toList()),
      ),
    );
  }
}
