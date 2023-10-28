import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget{
  const OptionButton({required this.answersText,required this.onTap,super.key});
  final void Function() onTap;
  final String answersText;

  @override
  Widget build(BuildContext context){
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 40,
            ),
            backgroundColor: Colors.white,
            foregroundColor: const Color.fromARGB(255, 191, 52, 63),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(answersText)
    );
  }
}