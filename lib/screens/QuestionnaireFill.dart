import 'package:edge_alert/edge_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:loading_dialog/loading_dialog.dart';
import 'package:mediquest_mobile/connectivity/ApiClient.dart';
import 'package:mediquest_mobile/managers/QuestionnaireManager.dart';
import 'package:mediquest_mobile/models/Patient.dart';
import 'package:mediquest_mobile/models/Questionnaire.dart';

// so we're create a normal startup of a flutter application here
// so in our MyHomePage is where we're going to be working

class QuestionnaireFill extends StatelessWidget {
  int assignmentId;

  QuestionnaireFill(@required this.assignmentId);

  final _formKey = new GlobalKey<FormState>();
  String mentor;
  String startOfRotation;
  String institution;
  String department;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 2,
          shadowColor: Colors.grey,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text(
                      'Fill In Question',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      labelText: 'Mentor',
                      icon: Icon(Icons.accessibility),
                    ),
                    onSaved: (value) => mentor = (value),
                    validator: (value) =>
                        value.isEmpty ? 'Mentor can\'t be empty' : null,
                  ),
                  FormBuilderDateTimePicker(
                    name: 'date',

                    inputType: InputType.both,
                    decoration: const InputDecoration(
                      labelText: 'Start rotation date',
                      icon: Icon(Icons.accessibility),
                    ),

                    pickerType: PickerType.cupertino,
                    onSaved: (value) {
                      startOfRotation = value.toString();
                    },
                    validator: (value) {
                      return value == null
                          ? "Start of rotation  can\'t be empty"
                          : null;
                    },
                    controller: TextEditingController(),
                    //locale: Locale.fromSubtags(languageCode: 'fr'),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      labelText: 'Institution',
                      icon: Icon(Icons.accessibility),
                    ),
                    onSaved: (value) => institution = (value),
                    validator: (value) =>
                        value.isEmpty ? 'Institution can\'t be empty' : null,
                  ),
                  TextFormField(
                    controller: TextEditingController(),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Department',
                      icon: Icon(Icons.accessibility),
                    ),
                    onSaved: (value) => department = (value),
                    validator: (value) =>
                        value.isEmpty ? 'Department can\'t be empty' : null,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: MaterialButton(
                                color: Theme.of(context).accentColor,
                                child: const Text(
                                  'Submit',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                    LoadingDialog loadingDialog = LoadingDialog(
                                        buildContext: context,
                                        loadingMessage: "Filling...");
                                    loadingDialog.show();
                                    await sendQuestionnaire(
                                        context: context,
                                        startOfRotation: startOfRotation,
                                        institution: institution,
                                        mentor: mentor,
                                        department: department,
                                        assignmentId: assignmentId);
                                    loadingDialog.hide();
                                    Navigator.of(context).pop();
                                  } else {
                                    print(_formKey.currentState);
                                    print('validation failed');
                                  }
                                },
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: OutlineButton(
                                color: Theme.of(context).accentColor,
                                child: Text(
                                  'Reset',
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor),
                                ),
                                onPressed: () {
                                  _formKey.currentState.reset();
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future sendQuestionnaire(
      {String institution,
      String mentor,
      String startOfRotation,
      String department,
      int assignmentId,
      BuildContext context}) async {
    Questionnaire questionnaire = Questionnaire(
        department: department,
        mentor: mentor,
        institutionId: 1,
        startOfRotation: startOfRotation,
        institution: institution,
        interviewDate: DateTime.now().toString(),
        assignmentId: assignmentId);

    Questionnaire newQuestionnaire =
        await ApiClient().fillInQuestionnaire(questionnaire: questionnaire);
    if (newQuestionnaire != null) {
      EdgeAlert.show(context,
          title: 'Success',
          description: 'Questionnaire Submitted.',
          icon: Icons.check_circle_outline,
          backgroundColor: Colors.green,
          gravity: EdgeAlert.TOP);
    } else {
      EdgeAlert.show(context,
          title: 'Failure',
          description: 'Questionnaire Not Submitted.',
          icon: Icons.clear,
          backgroundColor: Colors.red,
          gravity: EdgeAlert.TOP);
    }
  }
}

Future<Patient> addPatient(Patient patientData, BuildContext context) async {
  LoadingDialog loadingDialog =
      LoadingDialog(buildContext: context, loadingMessage: "Creating...");
  loadingDialog.show();

  Patient patient = await QuestionnaireManager().addPatient(patientData);
  loadingDialog.hide();
  if (patient != null) {
    EdgeAlert.show(context,
        title: 'Success',
        description: 'Patient Created.',
        icon: Icons.check_circle_outline,
        backgroundColor: Colors.green,
        gravity: EdgeAlert.TOP);
  } else {
    {
      EdgeAlert.show(context,
          title: 'Failure',
          description: 'Failed to create patient.',
          icon: Icons.dangerous,
          backgroundColor: Colors.red,
          gravity: EdgeAlert.TOP);
    }
  }
  return patient;
}
