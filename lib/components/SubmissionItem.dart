import 'package:edge_alert/edge_alert.dart';
import 'package:flutter/material.dart';
import 'package:loading_dialog/loading_dialog.dart';
import 'package:mediquest_mobile/managers/SubmissionManager.dart';
import 'package:mediquest_mobile/models/Submission.dart';
import 'package:mediquest_mobile/screens/SubmissionProfile.dart';

class SubmissionItem extends StatelessWidget {
  Submission submission;

  SubmissionItem(this.submission);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: ExpansionTile(
          title: ListTile(
            leading: CircleAvatar(
              radius: 24.0,
              backgroundColor: Colors.blueGrey,
            ),
            title: Row(
              children: <Widget>[
                Text(submission?.student?.user?.name),
                SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: Text(
                    submission.createdAt.toString(),
                    style: TextStyle(fontSize: 12.0),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            subtitle: Text(submission?.patient?.initials ?? "UNKNOWN"),
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
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return SubmissionProfile(submission);
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
                          Submission approvedSubmission =
                              await approveSubmission(submission?.id, context);
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
                          rejectSubmission(submission?.id, context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
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
