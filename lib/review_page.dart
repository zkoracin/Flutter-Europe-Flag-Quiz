import 'package:europe_flag_quiz/buttons/action_button.dart';
import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage(this.summary, this.restartQuiz, {super.key});

  final VoidCallback restartQuiz;
  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    final mistakes = summary
        .where((data) => data['user_answer'] != data['correct_answer'])
        .toList();

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Let\'s review your mistakes',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),

          SizedBox(
            height: 300,
            child: SingleChildScrollView(
              child: Column(
                children: mistakes.map((data) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${(data['question_index'] as int) + 1}. ',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['question'] as String,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Your answer: ${data['user_answer']}',
                                style: const TextStyle(color: Colors.redAccent),
                              ),
                              Text(
                                'Correct answer: ${data['correct_answer']}',
                                style: const TextStyle(
                                  color: Colors.greenAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ActionButton('Restart', restartQuiz),
        ],
      ),
    );
  }
}
