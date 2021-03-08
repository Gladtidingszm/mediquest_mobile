import 'package:edge_alert/edge_alert.dart';
import 'package:flutter/material.dart';
import 'package:loading_dialog/loading_dialog.dart';
import 'package:mediquest_mobile/connectivity/ApiClient.dart';
import 'package:mediquest_mobile/managers/QuestionnaireManager.dart';
import 'package:mediquest_mobile/models/Question.dart';
import 'package:mediquest_mobile/models/SubmissionAnswer.dart';
import 'package:mediquest_mobile/models/request/Answer.dart';
import 'package:mediquest_mobile/models/request/SubmissionRequestBody.dart';
import 'package:mediquest_mobile/utils/QuestionGuiFetcher.dart';
import 'package:provider/provider.dart';

class QuestionnaireView extends StatelessWidget {
  int submissionId;

  QuestionnaireView(this.submissionId);

  @override
  Widget build(BuildContext context) {
    final _questionnaireFormKey = new GlobalKey<FormState>();

    return ChangeNotifierProvider<QuestionnaireAnswersProvider>(
      create: (context) => QuestionnaireAnswersProvider(),
      builder: (context, child) => SingleChildScrollView(
        child: Container(
          // height: screenHeight(context)*.9,
          margin: EdgeInsets.all(5),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: FutureBuilder(
              builder: (context, AsyncSnapshot snap) {
                switch (snap.connectionState) {
                  case ConnectionState.none:
                    return Center(
                        child: Text("No internet,  Please try later"));
                    break;
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                    break;
                  case ConnectionState.active:
                    return Center(child: Text("active"));
                    break;
                  case ConnectionState.done:
                    if (snap.hasData && snap.data.length != 0) {
                      return Form(
                        key: _questionnaireFormKey,
                        child: Column(
                          children: [
                            SingleChildScrollView(
                              primary: true,
                              child: ListView.builder(
                                itemCount: snap.data.length,
                                shrinkWrap: true,
                                primary: false,
                                itemBuilder: (context, index) {
                                  Question question = snap.data[index];
                                  return QuestionGUIFetcher.getQuestionGUI(
                                      question);
                                },
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                MaterialButton(
                                  color: Theme.of(context).accentColor,
                                  child: const Text(
                                    'Submit',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () async {
                                    if (_questionnaireFormKey.currentState
                                        .validate()) {
                                      _questionnaireFormKey.currentState.save();

                                      List<SubmissionAnswer> answers =
                                          await submitRevision(
                                              Provider.of<QuestionnaireAnswersProvider>(
                                                      context,
                                                      listen: false)
                                                  ._answers,
                                              submissionId,
                                              context);
                                    }

                                    Provider.of<QuestionnaireAnswersProvider>(
                                            context,
                                            listen: false)
                                        ._answers
                                        .forEach((element) {
                                      print("sending" +
                                          element.toJson().toString());
                                    });
                                  },
                                ),
                                const SizedBox(width: 20),
                                OutlineButton(
                                  color: Theme.of(context).accentColor,
                                  child: Text(
                                    'Reset',
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor),
                                  ),
                                  onPressed: () {
                                    _questionnaireFormKey.currentState.reset();
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Container(
                        child: Center(
                          child: Text("Oops,  No data,Check You Have Internet"),
                        ),
                      );
                    }
                    break;
                }
                return Container();
              },
              future: getQuestions(),
            ),
          ),
        ),
      ),
    );
  }

  Future<List<Question>> getQuestions() async {
    print("getting questions");
    List<Question> questions = List();

    questions = await QuestionnaireManager().getAllQuestions();

    if (questions != null && questions.isNotEmpty) {
      print("on data return questions  list not empty");
      return questions;
    } else {
      print(" on data return question   list empty ");
    }
  }
}

Future<List<SubmissionAnswer>> submitRevision(
    List<Answer> answers, submissionId, BuildContext context) async {
  print("resubmitting answers");
  List<SubmissionAnswer> submissionAnswers;
  LoadingDialog dialog =
      LoadingDialog(buildContext: context, loadingMessage: "Submitting ");
  dialog.show();

  submissionAnswers = await ApiClient().reSubmitPatientResponses(
      submission:
          SubmissionRequestBody(submissionId: submissionId, answers: answers));
  dialog.hide();

  if (submissionAnswers != null && submissionAnswers.length != 0) {
    print("on data return submission not null");
    EdgeAlert.show(context,
        title: 'Success',
        description: 'Responses resubmitted.',
        icon: Icons.check_circle_outline,
        backgroundColor: Colors.green,
        gravity: EdgeAlert.TOP);
    Navigator.pop(context);
    return submissionAnswers;
  } else {
    print(" on data return submission null ");
    EdgeAlert.show(context,
        title: 'Failure',
        description: 'Responses not submitted.',
        icon: Icons.clear,
        backgroundColor: Colors.redAccent,
        gravity: EdgeAlert.TOP);
  }
}

class QuestionnaireAnswersProvider extends ChangeNotifier {
  List<Answer> _answers = List();

  void addAnswer({String response, int questionId}) {
    var answer = Answer(response: response, questionId: questionId);
    var answerExists = _answers.firstWhere(
        (element) => element.questionId == answer.questionId, orElse: () {
      return null;
    });

    if (answerExists == null) {
      _answers.add(answer);
      print("added answer");
      print("***********");
      print(answer.toString());
      print("***********");
    } else {
      _answers.remove(answerExists);
      _answers.add(answer);
      print("updated answer");
      print("***********");
      print(answer);
      print("***********");
    }
    notifyListeners();
  }
}