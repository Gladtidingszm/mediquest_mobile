import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mediquest_mobile/models/Question.dart';
import 'package:mediquest_mobile/utils/GeneralUtils.dart';

class TextAnswerQuestion extends StatefulWidget {
  Question question;

  TextAnswerQuestion(Question question);

  @override
  _TextAnswerQuestionState createState() => _TextAnswerQuestionState();
}

class _TextAnswerQuestionState extends State<TextAnswerQuestion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Container(
        child: FormBuilderTextField(
          autovalidateMode: AutovalidateMode.always,
          name: ' ',
          decoration: InputDecoration(
            labelText: widget?.question?.questionText,

            /*suffixIcon: _hasError
                 ? const Icon(Icons.error, color: Colors.red)
                 : const Icon(Icons.check, color: Colors.green),*/
          ),
          onChanged: (val) {
            setState(() {
              // _hasError =
              // !_formKey.currentState.fields['age'].validate();
            });
          },
          // valueTransformer: (text) => num.tryParse(text),
          /* validator: FormBuilderValidators.compose([
             FormBuilderValidators.required(context),
             FormBuilderValidators.numeric(context),
             FormBuilderValidators.max(context, 70),
           ]),*/
          // initialValue: '12',

          //determine keyboard type according to the question type
          keyboardType: GeneralUtils.getKeyBoardType(widget.question?.dataType),

          textInputAction: TextInputAction.next,
        ),
      ),
    );
  }
}
