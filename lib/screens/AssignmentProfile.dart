import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediquest_mobile/models/Assignment.dart';
import 'package:mediquest_mobile/screens/QuestionaireList.dart';
import 'package:mediquest_mobile/utils/GUIUtils.dart';

class DetailPage extends StatelessWidget {
  final Assignment assignment;

  DetailPage(this.assignment);

  @override
  Widget build(BuildContext context) {
    final levelIndicator = Container(
      child: Container(
        child: LinearProgressIndicator(
            backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
            value: 20,
            valueColor: AlwaysStoppedAnimation(Colors.green)),
      ),
    );


    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 80.0),
        Icon(
          Icons.book,
          color: Colors.white,
          size: 40.0,
        ),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.green),
        ),
        SizedBox(height: 10.0),
        Text(
          "Assignment ${assignment.assignmentNumber}",
          style: TextStyle(color: Colors.white, fontSize: 32.0),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        spacedDivider,
        Text.rich(TextSpan(children: [
          TextSpan(
            text: "Due Date:\t\t\t",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          TextSpan(
            text: "${assignment.dueDate}",
            style: TextStyle(color: Colors.white),
          )
        ])),
        spacedDivider,
        Text.rich(TextSpan(children: [
          TextSpan(
            text: "Date Issued:\t\t\t",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          TextSpan(
            text: "${assignment.dateIssued}",
            style: TextStyle(color: Colors.white),
          )
        ])),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final bottomContentText = Text(
      "Here Also",
      style: TextStyle(fontSize: 18.0),
    );
    final readButton = Container(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RaisedButton(
              /*  onPressed: () => {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Scaffold(
                      body: Container(
                        child: PatientListScreen(questionnaire),
                  ));
                }))
              },*/
              color: Color.fromRGBO(58, 66, 86, 1.0),
              child: Text("START", style: TextStyle(color: Colors.white)),
            ),
          ],
        ));
    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText, readButton],
        ),
      ),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[
          topContent,
          Expanded(child: QuestionnaireList(assignment.id))
        ],
      ),
    );
  }
}