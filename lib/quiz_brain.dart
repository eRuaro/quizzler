import 'package:quizler/Questions.dart';

class QuizBrain {

  int _questionNumber = 0;

  List<Questions> _questions = [
    Questions(question: 'Neil Ruaro is a Flutter Developer', answer: true),
    Questions(question: 'Neil Ruaro is a C# Developer', answer: false),
    Questions(question: 'Neil Ruaro does Competitive Programming', answer: true),
    Questions(question: 'Neil Ruaro is single', answer: false),
    Questions(question: 'Neil Ruaro is a Data Analysts', answer: true),
    Questions(question: 'Neil Ruaro took Junior High School in Makati Science', answer: true),
    Questions(question: 'Neil Ruaro is currently a student of Ateneo de Manila University', answer: false),
    Questions(question: 'Neil Ruaro prefers C++ to Python', answer: true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    }  
  }

  String questionText() {
    return _questions[_questionNumber].questionText;
  }

  bool questionAnswer() {
    return _questions[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}