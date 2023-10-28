import 'package:flutter/material.dart';

class Question{
  const Question(this.questionText,this.answerOptions);
  final String questionText;
  final List<String> answerOptions;

  List<String> getShuffledOptions(){
    final tempList = List.of(answerOptions);
    tempList.shuffle();
    return tempList;
  }
}