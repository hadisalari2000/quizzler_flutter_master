import 'package:quizzler_flutter_master/question.dart';

class QuestionBank {
  int _questionNumber = 0;

  final List<Question> _questions = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in...', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question('No piece of square dry paper can be folded in half ...', false),
    Question('In London, UK, if you happen to die in the House of ...', true),
    Question('The loudest sound produced by any animal is 188 ...', false),
    Question('The total surface area of two human lungs is app...', true),
    Question('Google was originally called \"Backrub\".', true),
    Question('Chocolate affects a dog\'s heart and nervous system;', true),
    Question('In West Virginia, USA, if you accidentally ...', true),
  ];

  int getCurrentQuestionNumber(){
    return _questionNumber +1;
  }
  void nextQuestion() {
    _questionNumber++;
  }

  bool getCurrentQuestionAnswer() {
    return _questions[_questionNumber].getAnswer();
  }

  String getCurrentQuestionText() {
    return _questions[_questionNumber].getQuestionText();
  }

  bool isFinished() {
    return _questionNumber >= _questions.length - 1 ? true : false;
  }

  void restart(){
    _questionNumber=0;
  }
}
