import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget{

  const StartScreen(this.switchScreen,{super.key});
  final void Function() switchScreen ;
  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
          Image.asset('assets/images/quiz-logo.png',width:200),
          const SizedBox(height: 40),
          const Text(
            "Learn Flutter the Fun Way!!!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        const SizedBox(height: 40),
          OutlinedButton(
              onPressed: switchScreen,
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color.fromARGB(255, 191, 52, 63),
            ),
              child:const Text(
                  'Start Quiz',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
          ),
        ],
      );
  }
}