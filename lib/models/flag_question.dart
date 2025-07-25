class FlagQuestion {
  const FlagQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> get shuffledAnswers => answers.toList()..shuffle();
}
