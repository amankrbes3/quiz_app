import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget{
  const QuestionIdentifier({required this.questionNumber,required this.isCorrectAnswer,super.key});
  final int questionNumber;
  final bool isCorrectAnswer;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAnswer?Colors.lightGreen:Colors.red,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        (questionNumber+1).toString(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

}