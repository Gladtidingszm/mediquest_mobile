import 'package:flutter/material.dart';
import 'package:mediquest_mobile/utils/GeneralUtils.dart';

class Submissions extends StatefulWidget {
  @override
  _SubmissionsState createState() => _SubmissionsState();
}

class _SubmissionsState extends State<Submissions> {
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
          itemCount: Submission.dummyData.length,
          itemBuilder: (context, index) {
            Submission _model = Submission.dummyData[index];
            return Card(
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
            );
          },
        ),
      ),
    );
  }
}

class Submission {

  final String name;
  final String datetime;
  final String summary;

  Submission({  this.name, this.datetime, this.summary});

  static final List<Submission> dummyData = [
    Submission(

      name: "Laurent",
      datetime: "20:18",
      summary: "If something can go wrong it will?",
    ),
    Submission(

      name: "Tracy",
      datetime: "19:22",
      summary: "What does Lorem Ipsum mean?",
    ),
    Submission(

      name: "Claire",
      datetime: "14:34",
      summary: "Some thing here",
    ),
    Submission(
       name: "Joe",
      datetime: "11:05",
      summary: "Eminem is the best rapper in the world",
    ),
    Submission(
       name: "Mark",
      datetime: "09:46",
      summary: "Six-Nine is not a real rapper",
    ),
    Submission(
       name: "Williams",
      datetime: "08:15",
      summary: "It has been re-scheduled  ",
    ),
    Submission(
      name: "Williams",
      datetime: "08:15",
      summary: "It has been re-scheduled  ",
    ),
    Submission(
      name: "Williams",
      datetime: "08:15",
      summary: "It has been re-scheduled  ",
    ),
    Submission(
      name: "Williams",
      datetime: "08:15",
      summary: "It has been re-scheduled  ",
    ),
    Submission(
      name: "Williams",
      datetime: "08:15",
      summary: "It has been re-scheduled  ",
    ),
    Submission(
      name: "Williams",
      datetime: "08:15",
      summary: "It has been re-scheduled  ",
    ),
    Submission(
      name: "Williams",
      datetime: "08:15",
      summary: "It has been re-scheduled  ",
    ),
    Submission(
      name: "Williams",
      datetime: "08:15",
      summary: "It has been re-scheduled  ",
    ),
  ];
}