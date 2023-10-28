import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/model/option_button.dart';
import 'package:quiz_app/model/question_model.dart';

class QuestionScreen extends StatefulWidget{
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState(){
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen>{
  var currentQuestionIndex=0;
  void changeQuestion(){
    setState(() {
      if(currentQuestionIndex < questionList.length-1){
        currentQuestionIndex++;
      }
    });
  }
  void _prevQuestion(){
    setState(() {
      if(currentQuestionIndex>0) currentQuestionIndex--;
    });
  }
  void _nextQuestion(){
    setState(() {
      if(currentQuestionIndex< questionList.length-1) currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
  Question currentQuestion = questionList[currentQuestionIndex];
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            currentQuestion.questionText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40,),
          ...currentQuestion.getShuffledOptions().map((item){
            return OptionButton(onTap: changeQuestion,answersText: item,);
          }),
          const SizedBox(height: 40,),
          Row(
            mainAxisSize: MainAxisSize.min,
            children:[
              ElevatedButton(
                onPressed: _prevQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color.fromARGB(255, 191, 52, 63),
                ),
                child: const Text('Prev'),
              ),
              const SizedBox(width: 150,),
              ElevatedButton(
                onPressed: _nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color.fromARGB(255, 191, 52, 63),
                ),
                child: const Text('Next'),
              ),

            ]
          )
        ],
      ),
    );
  }

}