import 'package:europe_flag_quiz/buttons/action_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.onStartQuiz, {super.key});
  final VoidCallback onStartQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Geographic Europe Flag Quiz',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          const Text(
            'This quiz features the national flags of all 44 UN-recognized '
            'countries in geographic Europe.\n\nCan you match each flag to the '
            'correct country?',
            style: TextStyle(color: Colors.white, fontSize: 20, height: 1.4),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          ActionButton('Start', onStartQuiz),
        ],
      ),
    );
  }
}
