import 'package:flutter/material.dart';
import 'package:mediquest_mobile/managers/QuestionnaireManager.dart';
import 'package:mediquest_mobile/models/Question.dart';
import 'package:mediquest_mobile/utils/QuestionGuiFetcher.dart';

class QuestionnaireView extends StatefulWidget {
  @override
  _QuestionnaireViewState createState() => _QuestionnaireViewState();
}

class _QuestionnaireViewState extends State<QuestionnaireView> {
  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      ),
      body: SingleChildScrollView(
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
                    return Scaffold(
                      appBar: AppBar(
                        elevation: 0.1,
                        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
                        title: Text("Questions"),
                      ),
                      body: ListView.builder(
                        itemCount: snap.data.length,
                        itemBuilder: (context, index) {
                          Question question = snap.data[index];
                          return QuestionGUIFetcher.getQuestionGUI(question);
                        },
                      ),
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
            future: getQuestions(),
          ),
        ),
      ),
    );
  }
}

Future<List<Question>> getQuestions() async {
  print("getting products");
  List<Question> questions = List();

  questions = await QuestionnaireManager().getAllQuestions();

  if (questions != null && questions.isNotEmpty) {
    print("on data return questions  list not empty");
    return questions;
  } else {
    print(" on data return question   list empty ");
  }
}