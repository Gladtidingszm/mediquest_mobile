import 'package:flutter/material.dart';
import 'package:mediquest_mobile/models/Lesson.dart';
import 'package:mediquest_mobile/screens/QuestionaireProfile.dart';

class QuestionaireListItem extends StatelessWidget {
  Lesson _lesson;

  QuestionaireListItem(this._lesson);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white))),
            child: Icon(Icons.autorenew, color: Colors.grey),
          ),
          title: Text(
            _lesson.title,
            style:
                TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    // tag: 'hero',
                    child: LinearProgressIndicator(
                        backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                        value: _lesson.indicatorValue,
                        valueColor: AlwaysStoppedAnimation(Colors.green)),
                  )),
              Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(_lesson.level,
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
                    builder: (context) => DetailPage(lesson: _lesson)));
          },
        ),
      ),
    );
  }
}
