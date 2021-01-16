
import 'package:flutter/material.dart';
import 'package:flutter_question_answer_widget/flutter_question_answer_widget.dart';
import 'package:mediquest_mobile/components/date_answer_question.dart';
import 'package:mediquest_mobile/components/multiple_check_question.dart';
import 'package:mediquest_mobile/components/text_answer_question.dart';
import 'package:mediquest_mobile/components/single_check_question.dart';

class Questionaire extends StatefulWidget {
  @override
  _QuestionaireState createState() =>
      _QuestionaireState();
}

class _QuestionaireState
    extends State<Questionaire> {

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(


          children: [
            DateAnswerQuestion(1,"Enter your birthday"),
            SingleChecktQuestion("Do you go to church", ["Yes","No"], 1),
            MultiCheckQuestion("Movies you like",  [
              "Man of steel",
              "Batman vs Superman",
              "Suicide Squad",
              "Justice League",
              "Wonder Woman"
            ],2),
            SingleChecktQuestion("Do you go to church", ["Yes","No"], 1),
            SingleChecktQuestion("Are you gay", ["Yes","No"], 1),
            SingleChecktQuestion("Do you use Ebay", ["Yes","No"], 1),
            TextAnswerQuestion(5, "Whats your physical address"),




          ],
        ),
      ),
    );
  }
}