class Question{

  final String _questionText;
  final bool _answer;

  Question(this._questionText, this._answer);

  bool getAnswer(){
    return _answer;
  }

  String getQuestionText(){
    return _questionText;
  }
}