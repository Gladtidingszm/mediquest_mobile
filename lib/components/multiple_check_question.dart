import 'package:flutter/material.dart';
import 'package:flutter_question_answer_widget/flutter_question_answer_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class MultiCheckQuestion extends StatefulWidget {

  List<String> _options=[];
  int _questionNumber;
  String _question;

  MultiCheckQuestion(this._question,
      this._options, this._questionNumber);

  @override
  _MultiCheckQuestionState createState() =>
      _MultiCheckQuestionState();
}

class _MultiCheckQuestionState extends State<MultiCheckQuestion> {

  List selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    final TextStyle display1 = Theme.of(context).textTheme.headline4;
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          FlutterQuestionAnswerWidget.multiCheckSelection(
              answered: selectedOptions,
              question: widget._questionNumber.toString()+". ${widget._question}",
              questionTextStyle: GoogleFonts.oswald(textStyle: display1,fontSize:17,fontWeight: FontWeight.bold ),
              answerList: widget._options,
              answersFontFamily: "normal",
              onChanged: (String value) {
                if (selectedOptions.contains(value)) {
                  setState(() {
                    selectedOptions.remove(value);
                  });
                } else {
                  setState(() {
                    selectedOptions.add(value);
                  });
                }
              },
              activeColor: Colors.red),

        ],
      ),
    );
  }
}