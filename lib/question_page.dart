import 'package:europe_flag_quiz/answer_button.dart';
import 'package:europe_flag_quiz/data/questions.dart';
import 'package:flutter/material.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});
  @override
  Widget build(BuildContext context) {
    final question = questions[0];
    final flagPath = 'assets/icons/${question.text}';
    final answers = question.shuffledAnswers;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(flagPath, height: 80, fit: BoxFit.contain),
          const SizedBox(height: 40),
          Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...answers.map((answer) {
                return AnswerButton(answer: answer);
              }),
            ],
          ),
        ],
      ),
    );
  }
}
