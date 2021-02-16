import 'package:flutter/material.dart';
import 'package:mediquest_mobile/components/SubmissionItem.dart';
import 'package:mediquest_mobile/models/Submission.dart';
import 'package:mediquest_mobile/utils/DummyData.dart';

class SubmissionsScreen extends StatefulWidget {
  @override
  _SubmissionsScreenState createState() => _SubmissionsScreenState();
}

class _SubmissionsScreenState extends State<SubmissionsScreen> {
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
          itemCount: DummyData.submission.length,
          itemBuilder: (context, index) {
            Submission submission = DummyData.submission[index];
            return SubmissionItem(submission);
          },
        ),
      ),
    );
  }
}


