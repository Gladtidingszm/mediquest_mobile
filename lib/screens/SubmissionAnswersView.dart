import 'package:edge_alert/edge_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:loading_dialog/loading_dialog.dart';
import 'package:mediquest_mobile/models/Submission.dart';
import 'package:mediquest_mobile/models/SubmissionAnswer.dart';
import 'package:mediquest_mobile/utils/GUIUtils.dart';
import 'package:mediquest_mobile/utils/QuestionGuiFetcher.dart';

class SubmissionAnswersView extends StatefulWidget {
  Submission submission;

  SubmissionAnswersView(this.submission);

  @override
  _SubmissionAnswersViewState createState() => _SubmissionAnswersViewState();
}

class _SubmissionAnswersViewState extends State<SubmissionAnswersView> {
  Widget build(BuildContext context) {
    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: SingleChildScrollView(
        primary: true,
        child: Column(
          children: [
            Container(
              height: screenHeight(context) * .8,
              child: FutureBuilder(
                builder: (context, AsyncSnapshot snap) {
                  switch (snap.connectionState) {
                    case ConnectionState.none:
                      return Center(child: Text("No Data,  Please try later"));
                      break;
                    case ConnectionState.waiting:
                      return Center(child: CircularProgressIndicator());
                      break;
                    case ConnectionState.active:
                      return Center(child: Text("active"));
                      break;
                    case ConnectionState.done:
                      if (snap.hasData && snap.data.length != 0) {
                        return Expanded(
                          child: Card(
                            child: SingleChildScrollView(
                              primary: true,
                              child: Container(
                                margin: EdgeInsets.all(20),
                                child: ListView.builder(
                                  primary: false,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: snap.data.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    SubmissionAnswer answer = snap.data[index];
                                    print(
                                        "Question:   ${answer.question.questionText}   Response:   ${answer.response}");
                                    return QuestionGUIFetcher.getQuestionGUI(
                                        answer.question, answer.response);
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          child: Center(
                            child:
                                Text("Oops,  No data,Check You Have Internet"),
                          ),
                        );
                      }
                      break;
                  }
                  return Container();
                },
                future: getSubmissionAnswers(widget.submission.id),
              ),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: MaterialButton(
                      color: Theme.of(context).accentColor,
                      child: const Text(
                        'Confirm',
                        style: TextStyle(color: Colors.greenAccent),
                      ),
                      onPressed: () async {
                        Submission approvedSubmission = await approveSubmission(
                            widget.submission?.id, context);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: OutlineButton(
                      color: Theme.of(context).accentColor,
                      child: Text(
                        'Revise',
                        style: TextStyle(color: Colors.redAccent),
                      ),
                      onPressed: () async {
                        showSubmissionReviseHandlerView(
                            context, widget.submission.id);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.1,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                icon: Icon(
                  Icons.refresh_outlined,
                  size: 35,
                ),
                onPressed: () {
                  setState(() {});
                }),
          )
        ],
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text("Submission Answers"),
      ),
      body: makeBody,

      // bottomNavigationBar: makeBottom,
    );
  }
}

Future<List<SubmissionAnswer>> getSubmissionAnswers(int submissionId) async {
  print("getting submission asnwer heres");
  List<SubmissionAnswer> submissionAnswers = List();

  submissionAnswers =
      await SubmissionManager.getSubmissionAnswers(submissionId);

  if (submissionAnswers != null && submissionAnswers.isNotEmpty) {
    print("on data return submissionAnswers  list not empty");
    return submissionAnswers;
  } else {
    print(" on data return submissionAnswers   list empty ");
  }
}

Future<Submission> approveSubmission(int id, BuildContext context) async {
  LoadingDialog loadingDialog =
      LoadingDialog(buildContext: context, loadingMessage: "Approving...");
  loadingDialog.show();

  Submission approvedSubmission = await SubmissionManager.approveSubmission(id);
  loadingDialog.hide();
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

YYDialog showSubmissionReviseHandlerView(BuildContext context, submitionId) {
  return YYDialog().build(context)
    ..width = screenHeight(context) * 0.6
    //..height = screenWidth(context)*0.99
    ..backgroundColor = Colors.blueGrey
    ..borderRadius = 10.0
    ..showCallBack = () {
      print("showCallBack invoke");
    }
    ..dismissCallBack = () {
      print("dismissCallBack invoke");
    }
    ..widget(SubmissionReviseHandlerView(submitionId))
    ..animatedFunc = (child, animation) {
      return ScaleTransition(
        child: child,
        scale: Tween(begin: 0.0, end: 1.0).animate(animation),
      );
    }
    ..show();
}
