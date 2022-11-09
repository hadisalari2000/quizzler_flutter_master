import 'package:flutter/material.dart';
import 'question_bank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const Quizzer());
}

class Quizzer extends StatelessWidget {
  const Quizzer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuestionBank questionBank = QuestionBank();

  List<Icon> scourList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                "${questionBank.getCurrentQuestionNumber()}. ${questionBank.getCurrentQuestionText()}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  textStyle: const TextStyle(color: Colors.white)),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (questionBank.isFinished()) {
                    alert(context, "Questions Exited!!!");
                  } else {
                    checkUserAnswer(true);
                    questionBank.nextQuestion();
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  textStyle: const TextStyle(color: Colors.white)),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (questionBank.isFinished()) {
                    alert(context, "Questions Exited!!!");
                  } else {
                    checkUserAnswer(false);
                    questionBank.nextQuestion();
                  }
                });
              },
            ),
          ),
        ),
        Row(
          children: scourList,
        )
      ],
    );
  }

  void checkUserAnswer(bool userAnswer) {
    if (questionBank.getCurrentQuestionAnswer() == userAnswer) {
      scourList.add(const Icon(
        Icons.check,
        color: Colors.green,
      ));
    } else {
      scourList.add(const Icon(
        Icons.close,
        color: Colors.red,
      ));
    }
  }

  void alert(BuildContext context, String description) {
    /*Alert(
      context: context,
      title: "WARNING",
      desc: description,
    ).show();*/

    Alert(
      context: context,
      type: AlertType.warning,
      title: "RFLUTTER ALERT",
      desc: "Flutter is more awesome with RFlutter Alert.",
      buttons: [
        DialogButton(
          onPressed: () {
            restartQuiz();
            Navigator.pop(context);
          },
          /*onPressed: () => restartQuiz(),*/
          width: 120,
          child: const Text(
            "Restart",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();

  }

  restartQuiz() {
    setState(() {
      questionBank.restart();
      scourList = [];
    });
  }
}
