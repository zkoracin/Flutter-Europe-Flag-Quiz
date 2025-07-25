import 'package:europe_flag_quiz/data/questions.dart';
import 'package:europe_flag_quiz/home_page.dart';
import 'package:europe_flag_quiz/question_page.dart';
import 'package:europe_flag_quiz/results_page.dart';
import 'package:europe_flag_quiz/review_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const QuizApp());

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Europe Flag Quiz',
      debugShowCheckedModeBanner: false,
      home: Quiz(),
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String activePage = 'home-page';
  List<String> selectedAnswers = [];
  Map<String, Object> quizSummary = {};

  void switchPage(String page) {
    setState(() {
      activePage = page;
      if (page == 'home-page') {
        selectedAnswers = [];
      }
    });
  }

  void selectAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
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

      quizSummary = {
        'summary': summary,
        'total_questions': questions.length,
        'correct_answers': correctCount,
      };

      switchPage('results-page');
    }
  }

  @override
  Widget build(BuildContext context) {
    late final Widget page;

    switch (activePage) {
      case 'question-page':
        page = QuestionPage(selectAnswer);
        break;
      case 'results-page':
        page = ResultsPage(
          () => switchPage('home-page'),
          () => switchPage('review-page'),
          quizSummary,
        );
        break;
      case 'review-page':
        page = ReviewPage(
          quizSummary['summary'] as List<Map<String, Object>>,
          () => switchPage('home-page'),
        );
        break;
      default:
        page = HomePage(() => switchPage('question-page'));
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: page,
          ),
        ),
      ),
    );
  }
}
