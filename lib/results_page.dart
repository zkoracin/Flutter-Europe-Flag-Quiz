import 'package:europe_flag_quiz/data/questions.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(this.restartQuiz, this.selectedAnswers, {super.key});

  final VoidCallback restartQuiz;
  final List<String> selectedAnswers;

  Map<String, Object> get quizSummary {
    final summary = List.generate(selectedAnswers.length, (index) {
      final question = questions[index];
      return {
        'question_index': index,
        'question': question.text,
        'correct_answer': question.answers[0],
        'user_answer': selectedAnswers[index],
      };
    });

    final correctCount = summary
        .where((entry) => entry['correct_answer'] == entry['user_answer'])
        .length;

    return {
      'summary': summary,
      'total_questions': questions.length,
      'correct_answers': correctCount,
    };
  }

  @override
  Widget build(BuildContext context) {
    final data = quizSummary;
    final total = data['total_questions'] as int;
    final correct = data['correct_answers'] as int;

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
          ElevatedButton(
            onPressed: restartQuiz,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.blueAccent,
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 6,
              shadowColor: Colors.black45,
            ),
            child: const Text('Restart'),
          ),
        ],
      ),
    );
  }
}
