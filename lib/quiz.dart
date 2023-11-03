import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
  List<String> selectedAnswer=[];
  var activeScreen = 'start-screen';
  void switchScreen(){
    setState(() {
      activeScreen = 'question-screen';
    });
  }
  void chooseAnswer(String answer){
    selectedAnswer.add(answer);
    setState(() {
      if(selectedAnswer.length == questionList.length){
        activeScreen = 'result-screen';
      }
    });
  }
  void restartQuiz(){
    setState(() {
      selectedAnswer = [];
      activeScreen = 'question-screen';
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if(activeScreen == 'question-screen'){
      screenWidget = QuestionScreen(onSelect: chooseAnswer,);
    }
    if(activeScreen == 'result-screen'){
      screenWidget = ResultScreen(chosenAnswer: selectedAnswer,onRestart:restartQuiz); //replace this result-screen widget
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 58, 54, 54),
                Color.fromARGB(255, 43, 44, 49),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
          ),
          child: Center(
            child: screenWidget,
          ),
        ),
      ),
    );
  }

}