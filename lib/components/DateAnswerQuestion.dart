import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mediquest_mobile/models/Question.dart';
import 'package:mediquest_mobile/models/QuestionAnswersProvider.dart';
import 'package:provider/provider.dart';

class DateAnswerQuestion extends StatefulWidget {
  Question question;
  DateTime initialValue;

  String answer;

  DateAnswerQuestion(this.question, {this.initialValue}) {}

  @override
  _DateAnswerQuestionState createState() => _DateAnswerQuestionState();
}

class _DateAnswerQuestionState extends State<DateAnswerQuestion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Container(
        child: FormBuilderDateTimePicker(
          name: 'date',
          initialValue: widget.initialValue,
          enabled: true,
          inputType: InputType.date,
          enableInteractiveSelection: true,
          decoration: InputDecoration(
            labelText: widget.question?.questionText,
          ),
          initialTime: null,
          pickerType: PickerType.cupertino,
          onSaved: (newValue) {
            widget.answer = newValue.toString();
            Provider.of<QuestionnaireAnswersProvider>(context, listen: false)
                .addAnswer(
                    response: widget.answer, questionId: widget.question.id);
          },
        ),
      ),
    );
  }
}
