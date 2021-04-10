import 'package:flutter/material.dart';
import 'package:mediquest_mobile/models/Question.dart';
import 'package:mediquest_mobile/models/QuestionAnswersProvider.dart';
import 'package:provider/provider.dart';

class TextAnswerQuestion extends StatefulWidget {
  Question question;

  String answer;
  String initialValue;

  TextAnswerQuestion(Question question, {this.initialValue = null}) {
    this.question = question;
  }

  @override
  _TextAnswerQuestionState createState() => _TextAnswerQuestionState();
}

class _TextAnswerQuestionState extends State<TextAnswerQuestion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Container(
        child: TextFormField(
          initialValue: widget.initialValue,
          enabled: widget.initialValue == null ? true : false,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: widget.question.questionText,
          ),
          onSaved: (value) {
            widget.answer = value.toString();
            Provider.of<QuestionnaireAnswersProvider>(context, listen: false)
                .addAnswer(
                    response: widget.answer, questionId: widget.question.id);
          },
          onChanged: null,
          validator: (value) =>
              value.trim().isEmpty ? 'This answer can\'t be empty' : null,
        ),
      ),
    );
  }
}
