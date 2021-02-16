import 'package:flutter/material.dart';
import 'package:mediquest_mobile/models/Assignment.dart';
import 'package:mediquest_mobile/screens/AssignmentProfile.dart';

class AssignmentItemView extends StatelessWidget {
  Assignment assignment;

  AssignmentItemView(this.assignment);

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
            "Assignment No:  " + assignment.assignmentNumber,
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
                      child: Text.rich(TextSpan(children: [
                    TextSpan(
                      text: "Due:\t\t\t",
                      style: TextStyle(color: Colors.red),
                    ),
                    TextSpan(
                      text: "${assignment.dueDate}",
                    )
                  ])))),
            ],
          ),
          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(assignment)));
          },
        ),
      ),
    );
  }
}
