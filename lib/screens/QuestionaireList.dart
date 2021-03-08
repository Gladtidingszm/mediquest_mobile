import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:mediquest_mobile/components/QuestionaireListItem.dart';
import 'package:mediquest_mobile/managers/QuestionnaireManager.dart';
import 'package:mediquest_mobile/models/Questionnaire.dart';
import 'package:mediquest_mobile/screens/QuestionnaireFill.dart';
import 'package:mediquest_mobile/utils/GUIUtils.dart';

class QuestionnaireList extends StatefulWidget {
  var assignmentId;

  QuestionnaireList(this.assignmentId);

  @override
  _QuestionnaireListState createState() => _QuestionnaireListState();
}

class _QuestionnaireListState extends State<QuestionnaireList> {
  Widget build(BuildContext context) {
    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: SingleChildScrollView(
        primary: true,
        child: Container(
          margin: EdgeInsets.all(20),
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
                            return QuestionaireListItem(snap.data[index]);
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
            future: getAssignmentQuestionnaires(widget.assignmentId),
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.1,
        leading: Container(),
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text("  Questionnaires"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              showQuestionnaireFill(context, widget.assignmentId);
            },
          ),
          IconButton(
            icon: Icon(Icons.refresh_outlined),
            onPressed: () {
              setState(() {});
            },
          )
        ],
      ),
      body: makeBody,

      // bottomNavigationBar: makeBottom,
    );
  }
}

YYDialog showQuestionnaireFill(BuildContext context, int assignmentId) {
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
    ..widget(QuestionnaireFill(assignmentId))
    ..animatedFunc = (child, animation) {
      return ScaleTransition(
        child: child,
        scale: Tween(begin: 0.0, end: 1.0).animate(animation),
      );
    }
    ..show();
}

Future<List<Questionnaire>> getAssignmentQuestionnaires(
    int assignmentId) async {
  print("getting questionnaires");
  List<Questionnaire> questionnaires = List();

  questionnaires =
      await QuestionnaireManager().getAssignmentQuestionnaires(assignmentId);

  if (questionnaires != null && questionnaires.isNotEmpty) {
    print("on data return questionnaires  list not empty");
    return questionnaires;
  } else {
    print(" on data return questionnaires   list empty ");
  }
}
