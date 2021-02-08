import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mediquest_mobile/models/Question.dart';
import 'package:mediquest_mobile/models/SubmissionAnswer.dart';
import 'package:mediquest_mobile/screens/Questionaire.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MultipleSelectQuestion extends StatefulWidget {
  List<String> options;

  SubmissionAnswer answer;
  List<String> initialValue;

  MultipleSelectQuestion(Question question, {this.initialValue}) {
    this.question = question;
    this.options = question?.options?.split(",");
    this.maxSelect = question.selectionLimit;
    this.answer =
        SubmissionAnswer(null, question, null, DateTime.now(), DateTime.now());
  }

  Question question;

  int maxSelect;

  @override
  _MultipleSelectQuestionState createState() => _MultipleSelectQuestionState();
}

class _MultipleSelectQuestionState extends State<MultipleSelectQuestion> {


  @override
  Widget build(BuildContext context) {
    // int length = widget.options?.length;
    List<FormBuilderFieldOption> optionsView = List();
    widget.options?.forEach((element) {
      optionsView.add(FormBuilderFieldOption(value: element));
    });
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Container(
        child: FormBuilderCheckboxGroup(
          decoration: InputDecoration(
            labelText: widget.question?.questionText,
            labelStyle: TextStyle(fontSize: 18),
          ),
          initialValue: widget.initialValue,
          enabled: widget.initialValue == null ? true : false,
          name: ' ',
          options: optionsView,
          onSaved: (newValue) {
            widget.answer?.response = newValue.toString();
            Provider.of<QuestionnaireAnswersProvider>(context, listen: false)
                .addAnswer(answer: widget.answer, question: widget.question);
          },
          separator: const VerticalDivider(
            width: 10,
            thickness: 5,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
