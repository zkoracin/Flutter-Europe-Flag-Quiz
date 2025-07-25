import 'package:europe_flag_quiz/answer_button.dart';
import 'package:europe_flag_quiz/data/questions.dart';
import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage(this.onSelectAnswer, {super.key});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int questionIndex = 0;

  void onAnswerSelected(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];
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
                return AnswerButton(answer, () => onAnswerSelected(answer));
              }),
            ],
          ),
        ],
      ),
    );
  }
}
