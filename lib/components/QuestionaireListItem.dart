import 'package:flutter/material.dart';
import 'package:mediquest_mobile/models/Questionnaire.dart';
import 'package:mediquest_mobile/screens/PatientListScreen.dart';

class QuestionaireListItem extends StatelessWidget {
  Questionnaire questionnaire;

  QuestionaireListItem(this.questionnaire);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListTile(
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white))),
            child: Icon(Icons.autorenew, color: Colors.grey),
          ),
          title: Text(
            "Assignment:  " + questionnaire.assignmentId.toString(),
            style:
                TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          /*subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),*/

          subtitle: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    // tag: 'hero',
                    child: Text("Dept:"),
                  )),
              Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text("${questionnaire.department}",
                        style: TextStyle(color: Colors.black))),
              )
            ],
          ),
          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PatientListScreen(questionnaire)));
          },
        ),
      ),
    );
  }
}
