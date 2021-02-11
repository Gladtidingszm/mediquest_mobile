import 'package:flutter/material.dart';
import 'package:mediquest_mobile/components/DateAnswerQuestion.dart';
import 'package:mediquest_mobile/components/MultipleCheckQuestion.dart';
import 'package:mediquest_mobile/components/NumberAnswerQuestionView.dart';
import 'package:mediquest_mobile/components/SingleCheckQuestion.dart';
import 'package:mediquest_mobile/models/Question.dart';

class SubmissionProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text("Submission Profile"),
      ),
      body: Card(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DateAnswerQuestion(
                  Question(answerDatatype: "date", questionText: "Birthday"),
                  initialValue: DateTime.now(),
                ),
                DateAnswerQuestion(
                  Question(answerDatatype: "date", questionText: "Birthday"),
                  initialValue: DateTime.now(),
                ),
                NumberAnswerQuestionView(
                  Question(answerDatatype: "date", questionText: "Siblings"),
                  initialValue: 5,
                ),
                NumberAnswerQuestionView(
                  Question(answerDatatype: "date", questionText: "Age"),
                  initialValue: 5,
                ),
                SingleCheckQuestion(
                  Question(
                      answerDatatype: "date",
                      questionText: "Sex",
                      options: "Male,Female"),
                  initialValue: "Male",
                ),
                MultipleSelectQuestion(
                  Question(
                      answerDatatype: "text",
                      questionText: "Likes",
                      options: "Facebook,Twitter"),
                  initialValue: ["Facebook,Twitter"],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFieldText(String name, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text.rich(
          TextSpan(
            children: <TextSpan>[
              TextSpan(text: "$name:\t\n "),
              TextSpan(
                  text: "$content",
                  style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 0.3,
          color: Colors.black,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
