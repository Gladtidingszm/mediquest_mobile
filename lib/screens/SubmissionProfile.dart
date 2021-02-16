import 'package:edge_alert/edge_alert.dart';
import 'package:flutter/material.dart';
import 'package:loading_dialog/loading_dialog.dart';
import 'package:mediquest_mobile/components/DateAnswerQuestion.dart';
import 'package:mediquest_mobile/components/MultipleCheckQuestion.dart';
import 'package:mediquest_mobile/components/NumberAnswerQuestionView.dart';
import 'package:mediquest_mobile/components/SingleCheckQuestion.dart';
import 'package:mediquest_mobile/managers/SubmissionManager.dart';
import 'package:mediquest_mobile/models/Question.dart';
import 'package:mediquest_mobile/models/Submission.dart';
import 'package:mediquest_mobile/utils/GUIUtils.dart';

class SubmissionProfile extends StatelessWidget {
  Submission submission;

  SubmissionProfile(this.submission);

  @override
  Widget build(BuildContext context) {
    List<String> list = ["Facebook"];
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text("Submission Profile"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Card(
              child: SingleChildScrollView(
                primary: true,
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DateAnswerQuestion(
                        Question(
                            answerDatatype: "date", questionText: "Birthday"),
                        initialValue: DateTime.now(),
                      ),
                      DateAnswerQuestion(
                        Question(
                            answerDatatype: "date", questionText: "Birthday"),
                        initialValue: DateTime.now(),
                      ),
                      NumberAnswerQuestionView(
                        Question(
                            answerDatatype: "date", questionText: "Siblings"),
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
                        initialValue: list,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: screenHeight(context) * 0.1,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    color: Theme.of(context).accentColor,
                    child: const Text(
                      'Approve',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      approveSubmission(submission?.id, context);
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: OutlineButton(
                    color: Theme.of(context).accentColor,
                    child: Text(
                      'Review',
                      style: TextStyle(color: Theme.of(context).accentColor),
                    ),
                    onPressed: () {
                      rejectSubmission(submission?.id, context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
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

Future<Submission> approveSubmission(int id, BuildContext context) async {
  LoadingDialog loadingDialog =
      LoadingDialog(buildContext: context, loadingMessage: "Approving...");
  loadingDialog.show();

  Submission approvedSubmission =
      await SubmissionManager().approveSubmission(id);
  if (approvedSubmission != null) {
    EdgeAlert.show(context,
        title: 'Success',
        description: 'Submission confirmed.',
        icon: Icons.check_circle_outline,
        backgroundColor: Colors.green,
        gravity: EdgeAlert.TOP);
  } else {
    {
      EdgeAlert.show(context,
          title: 'Failure',
          description: 'Failed to confirm.',
          icon: Icons.dangerous,
          backgroundColor: Colors.red,
          gravity: EdgeAlert.TOP);
    }
  }
  return approvedSubmission;
}

Future<Submission> rejectSubmission(int id, BuildContext context) async {
  LoadingDialog loadingDialog =
      LoadingDialog(buildContext: context, loadingMessage: "Rejecting...");
  loadingDialog.show();

  Submission approvedSubmission =
      await SubmissionManager().rejectSubmission(id);
  if (approvedSubmission != null) {
    EdgeAlert.show(context,
        title: 'Success',
        description: 'Submission rejected.',
        icon: Icons.check_circle_outline,
        backgroundColor: Colors.green,
        gravity: EdgeAlert.TOP);
  } else {
    EdgeAlert.show(context,
        title: 'Failure',
        description: 'Failed to reject.',
        icon: Icons.dangerous,
        backgroundColor: Colors.red,
        gravity: EdgeAlert.TOP);
  }
  return approvedSubmission;
}
