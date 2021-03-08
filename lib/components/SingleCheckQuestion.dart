import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mediquest_mobile/models/Question.dart';
import 'package:mediquest_mobile/screens/QuestionaireView.dart';
import 'package:provider/provider.dart';

class SingleCheckQuestion extends StatefulWidget {
  Question question;
  List<String> options;

  String answer;
  String initialValue;

  SingleCheckQuestion(Question question, {this.initialValue}) {
    this.options = question?.options?.split(",");
    this.question = question;
  }

  @override
  _SingleCheckQuestionState createState() => _SingleCheckQuestionState();
}

class _SingleCheckQuestionState extends State<SingleCheckQuestion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Container(
        child: FormBuilderRadioGroup<String>(
          initialValue: widget.initialValue,
          enabled: widget.initialValue == null ? true : false,
          decoration: InputDecoration(
            labelText: widget.question.questionText,
            labelStyle: TextStyle(fontSize: 18),
          ),
          name: '',
          onChanged: (newValue) {},
          onSaved: (value) {
            widget.answer = value.toString();
            Provider.of<QuestionnaireAnswersProvider>(context, listen: false)
                .addAnswer(
                    response: widget.answer, questionId: widget.question.id);
          },
          validator: FormBuilderValidators.compose(
              [FormBuilderValidators.required(context)]),
          options: widget.options
              .map((lang) => FormBuilderFieldOption(
                    value: lang,
                    child: Text(lang),
                  ))
              .toList(growable: false),
          controlAffinity: ControlAffinity.trailing,
        ),
      ),
    );
  }
}
