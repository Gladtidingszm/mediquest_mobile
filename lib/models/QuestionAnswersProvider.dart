import 'package:flutter/material.dart';
import 'package:mediquest_mobile/models/request/Answer.dart';

class QuestionnaireAnswersProvider extends ChangeNotifier {
  List<Answer> answers = List();

  void addAnswer({String response, int questionId}) {
    var answer = Answer(response: response, questionId: questionId);
    var answerExists = answers.firstWhere(
        (element) => element.questionId == answer.questionId, orElse: () {
      return null;
    });

    if (answerExists == null) {
      answers.add(answer);
      print("added answer");
      print("***********");
      print(answer.toString());
      print("***********");
    } else {
      answers.remove(answerExists);
      answers.add(answer);
      print("updated answer");
      print("***********");
      print(answer);
      print("***********");
    }
    notifyListeners();
  }
}
