import 'package:flutter/material.dart';
import 'package:mediquest_mobile/models/Lesson.dart';

import 'PatientListScreen.dart';

class DetailPage extends StatelessWidget {
  final Lesson lesson;
  DetailPage({Key key, this.lesson}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final levelIndicator = Container(
      child: Container(
        child: LinearProgressIndicator(
            backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
            value: lesson.indicatorValue,
            valueColor: AlwaysStoppedAnimation(Colors.green)),
      ),
    );

    final program = Container(
      margin: const EdgeInsets.all(5.0),
      decoration: new BoxDecoration(

          borderRadius: BorderRadius.circular(5.0)),
      child:  Expanded(
        child: Text(
          "B. Eng",
          style: TextStyle(color: Colors.white),
        ),
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
          lesson.title,
          style: TextStyle(color: Colors.white, fontSize: 32.0),

          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        program,
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            Expanded(

                child: Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Text(
                      lesson.level,
                      style: TextStyle(color: Colors.white),
                    ))),
            Expanded( child: levelIndicator),

          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0),
          height: MediaQuery.of(context).size.height * 0.5,
        ),
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
      lesson.content,
      style: TextStyle(fontSize: 18.0),
    );
    final readButton = Container(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RaisedButton(
              onPressed: () => {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Scaffold(
                      body: Container(
                    child: PatientListScreen(),
                  ));
                }))
              },
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
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }
}