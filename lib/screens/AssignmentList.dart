import 'package:flutter/material.dart';
import 'package:mediquest_mobile/components/AssignmentItemView.dart';
import 'package:mediquest_mobile/managers/AssignmentManager.dart';
import 'package:mediquest_mobile/managers/AuthenticationManager.dart';
import 'package:mediquest_mobile/models/Assignment.dart';
import 'package:mediquest_mobile/screens/SubmissionsScreen.dart';

class AssignmentList extends StatefulWidget {


  @override
  _AssignmentListState createState() => _AssignmentListState();
}

class _AssignmentListState extends State<AssignmentList> {

  @override
  void initState() {
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
                            return AssignmentItemView(snap.data[index]);
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
            future: getAssignments(),
          ),
        ),
      ),
    );

    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text("Home"),
      actions: <Widget>[
        PopupMenuButton<String>(
          icon: Icon(
            Icons.person,
            size: 40,
          ),
          onSelected: (String result) {},
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: "",
              child: FlatButton(
                child: Text('Logout'),
                onPressed: () async {},
              ),
            ),

          ],
        ),
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


Future<List<Assignment>> getAssignments() async {
  print("getting assignments");
  List<Assignment> assignments = List();

  assignments = await AssignmentManager().getStudentAssignments();

  if (assignments != null && assignments.isNotEmpty) {
    print("on data return assignments  list not empty");
    return assignments;
  } else {
    print(" on data return assignments   list empty ");
  }
}


