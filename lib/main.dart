import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

QuizBrain quizBrain = QuizBrain();

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
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
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  // List<String> questions = [
  //   'Neil Ruaro is a Flutter Developer',
  //   'Neil Ruaro is a C# Developer',
  //   'Neil Ruaro does Competitive Programming',
  //   'Neil Ruaro is single',
  // ];

  // List<bool> answers = [
  //   true,
  //   false,
  //   true,
  //   false,
  // ];

  void checkAnswer(bool userAnswer) {
    //The user picked false.
    bool correctAnswer = quizBrain.questionAnswer();

    if (userAnswer == true) {
      if (correctAnswer == true) {
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
    } else {
      if (correctAnswer == false) {
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
    }
  }

  Expanded options(Color color, String option) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: FlatButton(
          color: color,
          child: Text(
            '$option',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            setState(() {
              if (quizBrain.isFinished() == true) {
                //This is the code for the basic alert from the docs for rFlutter Alert:
                //Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();

                //Modified for our purposes:
                Alert(
                  context: context,
                  title: 'Finished!',
                  desc: 'You\'ve reached the end of the quiz.',
                ).show();

                quizBrain.reset();

                scoreKeeper = [];
              } else {
                if (option == 'True') {
                  checkAnswer(true);
                } else {
                  checkAnswer(false);
                }

                quizBrain.nextQuestion();
              }


            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.questionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        options(Colors.green, 'True'),
        options(Colors.red, 'False'),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

// class Options extends StatelessWidget {
//   Options({this.color, this.option});
//
//   final Color color;
//   final String option;
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Padding(
//         padding: EdgeInsets.all(15.0),
//         child: FlatButton(
//           color: color,
//           child: Text(
//             '$option',
//             style: TextStyle(
//               fontSize: 20.0,
//               color: Colors.white,
//             ),
//           ),
//           onPressed: () {
//             //The user picked false.
//
//           },
//         ),
//       ),
//     );
//   }
// }
