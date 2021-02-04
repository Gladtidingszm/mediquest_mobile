import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mediquest_mobile/models/Question.dart';

class SingleCheckQuestion extends StatefulWidget {
  String question;
  List<String> options;

  SingleCheckQuestion(Question question) {
    this.options = question?.options.split(",");
    this.question = question.questionText;
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
          decoration: InputDecoration(
            labelText: widget.question,
          ),
          name: 'best_language',
          onChanged: (newValue) {},
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
