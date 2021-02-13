import 'package:quizler/Questions.dart';

class QuizBrain {
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

  String questionText(int questionNumber) {
    return _questions[questionNumber].questionText;
  }

  bool questionAnswer(int questionNumber) {
    return _questions[questionNumber].questionAnswer;
  }
}