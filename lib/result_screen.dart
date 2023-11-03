import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';

import 'model/question_summary/question_summary.dart';

class ResultScreen extends StatelessWidget{
  const ResultScreen({super.key,required this.chosenAnswer,required this.onRestart});
  final List<String> chosenAnswer;
  final void Function() onRestart;
  List<Map<String,Object>> get summaryData{
    final List<Map<String,Object>> data = [];
    for(int i=0;i<chosenAnswer.length;i++){
      data.add({
        'question_index':i,
        'question':questionList[i].questionText,
        'correct_answer':questionList[i].answerOptions[0],
        'user_answer':chosenAnswer[i],
      });
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    final int rightAnswerCount = summaryData.where((element) => element['correct_answer'] == element['user_answer']).length;
    final int totalQuestionCount = questionList.length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 5,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You marked $rightAnswerCount out of $totalQuestionCount Question Correctly!',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
            const SizedBox(height: 30,),
            QuestionSummary(summaryData),
            const SizedBox(height: 30,),
            TextButton.icon(
              onPressed: onRestart,
              icon: const Icon(Icons.refresh),
              style: TextButton.styleFrom(
                iconColor: Colors.white,
                foregroundColor: Colors.white,
              ),
              label: const Text(
                'Restart Quiz',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}