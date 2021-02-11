import 'package:flutter/material.dart';
import 'package:mediquest_mobile/models/Question.dart';
import 'package:mediquest_mobile/screens/Questionaire.dart';
import 'package:provider/provider.dart';

class NumberAnswerQuestionView extends StatelessWidget {
  Question question;
  String answer;
  num initialValue;

  NumberAnswerQuestionView(Question question, {this.initialValue}) {
    this.question = question;
  }

  Widget build(BuildContext context) {
    print(question.toJson());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Container(
        child: TextFormField(
          keyboardType: TextInputType.number,
          initialValue: initialValue.toString(),
          enabled: initialValue == null ? true : false,
          decoration: InputDecoration(
            labelText: question.questionText,
          ),
          onChanged: (newValue) {
            answer = newValue.toString();
            Provider.of<QuestionnaireAnswersProvider>(context, listen: false)
                .addAnswer(response: answer, questionId: question.id);
          },
        ),
      ),
    );
  }
}
