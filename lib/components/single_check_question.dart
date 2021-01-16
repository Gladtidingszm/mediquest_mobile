import 'package:flutter/material.dart';
import 'package:flutter_question_answer_widget/flutter_question_answer_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleChecktQuestion extends StatefulWidget {
  List<String> _options=[];
  int _questionNumber;
  String _question;



  SingleChecktQuestion(this._question,this._options, this._questionNumber);

  @override
  _SingleChecktQuestionState createState() => _SingleChecktQuestionState();
}

class _SingleChecktQuestionState extends State<SingleChecktQuestion> {
  String _answer;

  @override
  Widget build(BuildContext context) {
    final TextStyle display1 = Theme.of(context).textTheme.headline4;
    return  Container(
      margin: EdgeInsets.all(20),
      child: FlutterQuestionAnswerWidget.singleCheckSelection(
          answered: _answer,
          question: widget._questionNumber.toString()+". ${widget._question}",
          questionTextStyle: GoogleFonts.oswald(textStyle: display1,fontSize:17,fontWeight: FontWeight.bold ),
          answerList:widget._options,
          onChanged: (String value) {
            setState(() {
              _answer = value;
            });
          },
          activeColor: Colors.red),
    );
  }
}