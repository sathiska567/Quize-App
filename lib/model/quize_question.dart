class QuizeQuestion {
  const QuizeQuestion(this.text, this.answer);

  final String text;
  final List<String> answer;

// this is use to shuffle backend answer
  List<String> getShuffleAnswer() {
    final shuffleList = List.of(answer);
    shuffleList.shuffle();
    return shuffleList;
  }
}
