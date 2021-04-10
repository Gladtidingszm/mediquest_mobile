import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:mediquest_mobile/components/SubmissionItem.dart';
import 'package:mediquest_mobile/components/SubmissionReviseCommentView.dart';
import 'package:mediquest_mobile/managers/SubmissionManager.dart';
import 'package:mediquest_mobile/models/Submission.dart';
import 'package:mediquest_mobile/utils/GUIUtils.dart';

class SubmissionsView extends StatefulWidget {
  @override
  _SubmissionsViewState createState() => _SubmissionsViewState();
}

class _SubmissionsViewState extends State<SubmissionsView> {
  Widget build(BuildContext context) {
    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: SingleChildScrollView(
        primary: true,
        child: Container(
          child: FutureBuilder(
            builder: (context, AsyncSnapshot snap) {
              switch (snap.connectionState) {
                case ConnectionState.none:
                  return Center(child: Text("No internet,  Please try later"));
                  break;
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                  break;
                case ConnectionState.active:
                  return Center(child: Text("active"));
                  break;
                case ConnectionState.done:
                  if (snap.hasData && snap.data.length != 0) {
                    return Column(
                      children: [
                        ListView.builder(
                          primary: false,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snap.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return SubmissionListItemView(snap.data[index]);
                          },
                        ),
                      ],
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
            future: getAllSubmissions(),
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0.1,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: [
          IconButton(
              icon: Icon(
                Icons.refresh_outlined,
                size: 20,
              ),
              onPressed: () {
                setState(() {});
              }),
        ],
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text("Submissions"),
      ),
      body: makeBody,

      // bottomNavigationBar: makeBottom,
    );
  }
}

Future<List<Submission>> getAllSubmissions() async {
  print("getting submissions");
  List<Submission> submissions = List();

  submissions = await SubmissionManager.getAllSubmissions();

  if (submissions != null && submissions.isNotEmpty) {
    print("on data return submissions  list not empty");
    return submissions;
  } else {
    print(" on data return submissions   list empty ");
  }
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
