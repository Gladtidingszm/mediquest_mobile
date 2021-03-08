import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:mediquest_mobile/models/Submission.dart';
import 'package:mediquest_mobile/screens/QuestionaireView.dart';
import 'package:mediquest_mobile/utils/GUIUtils.dart';

import 'SubmissionReviseCommentView.dart';

class SubmissionListItemView extends StatefulWidget {
  Submission submission;

  SubmissionListItemView(this.submission);

  @override
  _SubmissionListItemViewState createState() => _SubmissionListItemViewState();
}

class _SubmissionListItemViewState extends State<SubmissionListItemView> {
  @override
  Widget build(BuildContext context) {
    String status = widget.submission.status;
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
                Text(widget.submission?.student?.user?.name),
                SizedBox(
                  width: 13.0,
                ),
              ],
            ),
            trailing: Text(
              widget.submission.status,
              style: TextStyle(
                fontSize: 14.0,
                color: status == "approved"
                    ? Colors.greenAccent
                    : status == "pending"
                        ? Colors.blue
                        : Colors.red,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            subtitle: Text(
              "Patient:  ${widget.submission?.patient?.initials ?? "UNKNOWN"}",
              style: TextStyle(fontSize: 13),
            ),
          ),
          children: <Widget>[
            ListTile(
              title: SizedBox(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: <Widget>[
                    const SizedBox(width: 20),
                    Expanded(
                      child: MaterialButton(
                        color: Theme.of(context).accentColor,
                        child: const Text(
                          'Redo',
                          style: TextStyle(color: Colors.greenAccent),
                        ),
                        onPressed: () async {
                          print("hereeeeeeeeeeeeee");
                          print(widget.submission.toJson());
                          showQuestionnaire(
                              context, widget.submission.patient.id);
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: OutlineButton(
                        color: Theme.of(context).accentColor,
                        child: Text(
                          'Comment',
                          style: TextStyle(color: Colors.redAccent),
                        ),
                        onPressed: () async {
                          showAddCommentDialog(
                              context, widget.submission?.comment);
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

YYDialog showQuestionnaire(BuildContext context, int submissionId) {
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
    ..widget(QuestionnaireView(submissionId))
    ..animatedFunc = (child, animation) {
      return ScaleTransition(
        child: child,
        scale: Tween(begin: 0.0, end: 1.0).animate(animation),
      );
    }
    ..show();
}

YYDialog showAddCommentDialog(BuildContext context, String comment) {
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
    ..widget(SubmissionReviseCommentView(comment))
    ..animatedFunc = (child, animation) {
      return ScaleTransition(
        child: child,
        scale: Tween(begin: 0.0, end: 1.0).animate(animation),
      );
    }
    ..show();
}
