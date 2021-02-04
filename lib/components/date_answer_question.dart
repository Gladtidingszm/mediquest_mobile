import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mediquest_mobile/models/Question.dart';

class DateAnswerQuestion extends StatefulWidget {
  Question question;

  DateAnswerQuestion(this.question);

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
          initialValue: DateTime.now(),
          inputType: InputType.both,
          decoration: InputDecoration(
            labelText: widget.question?.questionText,
          ),
          initialTime: TimeOfDay(hour: 8, minute: 0),
          pickerType: PickerType.material,
        ),
      ),
    );
  }
}
