import 'package:edge_alert/edge_alert.dart';
import 'package:flutter/material.dart';
import 'package:loading_dialog/loading_dialog.dart';
import 'package:mediquest_mobile/managers/SubmissionManager.dart';
import 'package:mediquest_mobile/models/Submission.dart';
import 'package:mediquest_mobile/screens/SubmissionProfile.dart';
import 'package:mediquest_mobile/utils/GeneralUtils.dart';

class SubmissionsScreen extends StatefulWidget {
  @override
  _SubmissionsScreenState createState() => _SubmissionsScreenState();
}

class _SubmissionsScreenState extends State<SubmissionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text("Submissions"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: SubmissionDummy.dummyData.length,
          itemBuilder: (context, index) {
            SubmissionDummy _model = SubmissionDummy.dummyData[index];
            return Card(
              child: ExpansionTile(
                title: ListTile(
                  leading: CircleAvatar(
                    radius: 24.0,
                    backgroundColor: getRandomColor(),
                  ),
                  title: Row(
                    children: <Widget>[
                      Text(_model.name),
                      SizedBox(
                        width: 16.0,
                      ),
                      Text(
                        _model.datetime,
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                  subtitle: Text(_model.summary),
                ),
                children: <Widget>[
                  ListTile(
                    title: SizedBox(
                      height: 50,
                      width: 350,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: OutlineButton(
                              color: Colors.blueAccent,
                              child: Text(
                                'View',
                                style: TextStyle(
                                    color: Theme.of(context).accentColor),
                              ),
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return SubmissionProfile();
                                }));
                              },
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: MaterialButton(
                              color: Theme.of(context).accentColor,
                              child: const Text(
                                'Confirm',
                                style: TextStyle(color: Colors.greenAccent),
                              ),
                              onPressed: () async {
                                //todo make id live
                                Submission approvedSubmission =
                                    await approveSubmission(1, context);
                              },
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: OutlineButton(
                              color: Theme.of(context).accentColor,
                              child: Text(
                                'Deny',
                                style: TextStyle(color: Colors.redAccent),
                              ),
                              onPressed: () {
                                //todo make id live
                                rejectSubmission(1, context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
            /*Card(
              elevation: 2,
              child: Column(
                children: <Widget>[
                  Divider(
                    height: 12.0,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 24.0,
                      backgroundColor: getRandomColor(),
                    ),
                    title: Row(
                      children: <Widget>[
                        Text(_model.name),
                        SizedBox(
                          width: 16.0,
                        ),
                        Text(
                          _model.datetime,
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ],
                    ),
                    subtitle: Text(_model.summary),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 14.0,
                    ),
                  ),
                ],
              ),
            );*/
          },
        ),
      ),
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

class SubmissionDummy {
  final String name;
  final String datetime;
  final String summary;

  SubmissionDummy({this.name, this.datetime, this.summary});

  static final List<SubmissionDummy> dummyData = [
    SubmissionDummy(
      name: "Laurent",
      datetime: "20:18",
      summary: "If something can go wrong it will?",
    ),
    SubmissionDummy(
      name: "Tracy",
      datetime: "19:22",
      summary: "What does Lorem Ipsum mean?",
    ),
    SubmissionDummy(
      name: "Claire",
      datetime: "14:34",
      summary: "Some thing here",
    ),
    SubmissionDummy(
      name: "Joe",
      datetime: "11:05",
      summary: "Eminem is the best rapper in the world",
    ),
    SubmissionDummy(
      name: "Mark",
      datetime: "09:46",
      summary: "Six-Nine is not a real rapper",
    ),
    SubmissionDummy(
      name: "Williams",
      datetime: "08:15",
      summary: "It has been re-scheduled  ",
    ),
    SubmissionDummy(
      name: "Williams",
      datetime: "08:15",
      summary: "It has been re-scheduled  ",
    ),
    SubmissionDummy(
      name: "Williams",
      datetime: "08:15",
      summary: "It has been re-scheduled  ",
    ),
    SubmissionDummy(
      name: "Williams",
      datetime: "08:15",
      summary: "It has been re-scheduled  ",
    ),
    SubmissionDummy(
      name: "Williams",
      datetime: "08:15",
      summary: "It has been re-scheduled  ",
    ),
    SubmissionDummy(
      name: "Williams",
      datetime: "08:15",
      summary: "It has been re-scheduled  ",
    ),
    SubmissionDummy(
      name: "Williams",
      datetime: "08:15",
      summary: "It has been re-scheduled  ",
    ),
    SubmissionDummy(
      name: "Williams",
      datetime: "08:15",
      summary: "It has been re-scheduled  ",
    ),
  ];
}