import 'package:flutter/material.dart';
import 'package:quiz_app/model/question_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget{
  const SummaryItem(this.map,{super.key});
  final Map<String,Object> map;
  @override
  Widget build(BuildContext context) {
    final bool isCorrectAnswer = map['user_answer'] == map['correct_answer'];
    return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 5,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            QuestionIdentifier(questionNumber:map['question_index'] as int,isCorrectAnswer:isCorrectAnswer),
            const SizedBox(width: 10,),
            Expanded(
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      map['question'] as String,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      map['user_answer'] as String,
                      style: TextStyle(
                        color: isCorrectAnswer?Colors.lightGreen:Colors.red,
                      ),
                    ),
                    Text(
                        map['correct_answer'] as String,
                      style: const TextStyle(
                        color: Colors.lightGreen,
                      ),
                    ),
                  ],
                ),
            ),
          ],
        ),
    );
  }
}