import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// so we're create a normal startup of a flutter application here
// so in our MyHomePage is where we're going to be working

class SubmissionReviseCommentView extends StatelessWidget {
  String comment;

  SubmissionReviseCommentView(this.comment);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 2,
          shadowColor: Colors.grey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    'View Revision Comment',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      // textfield for the name session and so on
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.message),
                        ),
                        maxLines: 10,
                        enabled: false,
                        initialValue: comment ?? "No Comment",
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
