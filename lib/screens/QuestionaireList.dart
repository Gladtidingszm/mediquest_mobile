import 'package:flutter/material.dart';
import 'package:mediquest_mobile/components/QuestionaireListItem.dart';
import 'package:mediquest_mobile/managers/QuestionnaireManager.dart';
import 'package:mediquest_mobile/models/Lesson.dart';
import 'package:mediquest_mobile/models/Questionnaire.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List lessons;

  @override
  void initState() {
    lessons = getLessons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: SingleChildScrollView(
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
            future: getQuestionnaires(),
          ),
        ),
      ),
    );

    final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.blur_on, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.hotel, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.account_box, color: Colors.white),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text("All Questionnaires"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list),
          onPressed: () {},
        )
      ],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: topAppBar,
      body: makeBody,
      // bottomNavigationBar: makeBottom,
    );
  }
}

Future<List<Questionnaire>> getQuestionnaires() async {
  print("getting questionnaires");
  List<Questionnaire> questionnaires = List();

  questionnaires = await QuestionnaireManager().getStudentQuestionnaires();

  if (questionnaires != null && questionnaires.isNotEmpty) {
    print("on data return questionnaires  list not empty");
    return questionnaires;
  } else {
    print(" on data return questionnaires   list empty ");
  }
}

List getLessons() {
  return [
    Lesson(
        title: "Data Mining",
        level: "Progress",
        indicatorValue: 0.33,
        price: 20,
        content:
            "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
    Lesson(
        title: "Commerce",
        level: "Progress",
        indicatorValue: 0.33,
        price: 50,
        content:
        "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
    Lesson(
        title: "Computer Networks",
        level: "Progress",
        indicatorValue: 0.66,
        price: 30,
        content:
        "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
    Lesson(
        title: "Artificial Intelligence",
        level: "Progress",
        indicatorValue: 0.66,
        price: 30,
        content:
        "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
    Lesson(
        title: "Network Security pppppp pppp",
        level: "Progress",
        indicatorValue: 1.0,
        price: 50,
        content:
        "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
    Lesson(
        title: "Engine Studies",
        level: "Progress",
        indicatorValue: 1.0,
        price: 50,
        content:
        "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
    Lesson(
        title: "Statics ",
        level: "Progress",
        indicatorValue: 1.0,
        price: 50,
        content:
        "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.  ")
  ];
}












