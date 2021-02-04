import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mediquest_mobile/models/Question.dart';

// ignore: must_be_immutable
class MultipleSelectQuestion extends StatefulWidget {

  List<String> options;


  MultipleSelectQuestion(Question question) {
    this.question = question?.questionText;
    this.options = question?.options?.split(",");
    this.maxSelect = question.selectionLimit;
  }

  String question;

  int maxSelect;

  @override
  _MultipleSelectQuestionState createState() => _MultipleSelectQuestionState();
}

class _MultipleSelectQuestionState extends State<MultipleSelectQuestion> {


  @override
  Widget build(BuildContext context) {
    int length = widget.options.length;
    List<FormBuilderFieldOption> optionsView = List();
    widget.options.forEach((element) {
      optionsView.add(FormBuilderFieldOption(value: element,));
    });
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Container(
        child: FormBuilderCheckboxGroup(

          decoration: InputDecoration(
              labelText: widget.question),
          name: 'languages',
          initialValue: [""],
          options: optionsView,
          onChanged: (value) {


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
