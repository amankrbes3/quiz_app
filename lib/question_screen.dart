import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/model/option_button.dart';
import 'package:quiz_app/model/question_model.dart';

class QuestionScreen extends StatefulWidget{
  const QuestionScreen({super.key,required this.onSelect});
  final void Function(String answer) onSelect;
  @override
  State<QuestionScreen> createState(){
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen>{
  var currentQuestionIndex=0;
  void changeQuestion(String answer){
    widget.onSelect(answer);
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
    widget.onSelect('Not answered');
    setState(() {
      if(currentQuestionIndex< questionList.length-1) currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
  Question currentQuestion = questionList[currentQuestionIndex];
    return Container(
      padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
              return OptionButton(
                onTap:(){changeQuestion(item);},
                answersText: item,);
            }),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                ElevatedButton(
                  onPressed: _prevQuestion,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color.fromARGB(255, 191, 52, 63),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Prev'),
                ),
                const SizedBox(width: 150,),
                ElevatedButton(
                  onPressed: _nextQuestion,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color.fromARGB(255, 191, 52, 63),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Next'),
                ),
              ],
            ),
          ],
        ),
    );
  }
}