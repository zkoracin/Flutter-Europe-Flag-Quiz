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
            height: 500,
            child: SingleChildScrollView(
              child: Column(
                children: mistakes.map((data) {
                  final String flagPath = 'assets/icons/${data['question']}';
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          flagPath,
                          width: 60,
                          height: 40,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Your answer: ${data['user_answer']}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Correct answer: ${data['correct_answer']}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
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
