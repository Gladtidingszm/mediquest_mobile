import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mediquest_mobile/models/Question.dart';
import 'package:mediquest_mobile/models/QuestionAnswersProvider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MultipleSelectQuestion extends StatefulWidget {
  List<String> options;

  String answer;
  List<String> initialValue;

  MultipleSelectQuestion(Question question, {this.initialValue}) {
    this.question = question;
    this.options = question?.options?.split(",");
    this.maxSelect = question.selectionLimit;
  }

  Question question;

  int maxSelect;

  @override
  _MultipleSelectQuestionState createState() => _MultipleSelectQuestionState();
}

class _MultipleSelectQuestionState extends State<MultipleSelectQuestion> {
  bool enabled = true;

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
            labelStyle: TextStyle(fontSize: 25),
          ),
          initialValue: widget.initialValue,
          enabled: enabled,
          name: ' ',
          options: optionsView,
          validator: (value) {
            return (value == null || value.length == 0)
                ? 'This answer can\'t be empty'
                : (value.length > widget.maxSelect)
                    ? "Max limit is ${widget.maxSelect}"
                    : null;
          },
          onSaved: (newValue) {
            widget.answer = newValue.join(",").trim();
            print(widget.answer);
            Provider.of<QuestionnaireAnswersProvider>(context, listen: false)
                .addAnswer(
                    response: widget.answer, questionId: widget.question.id);
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
