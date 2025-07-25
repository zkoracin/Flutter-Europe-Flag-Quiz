import 'package:europe_flag_quiz/buttons/action_button.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
    this.restartQuiz,
    this.reviewQuiz,
    this.quizSummary, {
    super.key,
  });

  final VoidCallback restartQuiz;
  final VoidCallback reviewQuiz;
  final Map<String, Object> quizSummary;

  @override
  Widget build(BuildContext context) {
    final total = quizSummary['total_questions'] as int;
    final correct = quizSummary['correct_answers'] as int;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Finished',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Text(
            'Out of $total questions, you answered $correct correctly.',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          if (total != correct) ActionButton('Review', reviewQuiz),
          const SizedBox(height: 30),
          ActionButton('Restart', restartQuiz),
        ],
      ),
    );
  }
}
