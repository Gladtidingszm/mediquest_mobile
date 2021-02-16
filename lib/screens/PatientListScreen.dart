import 'package:cool_alert/cool_alert.dart';
import 'package:edge_alert/edge_alert.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:loading_dialog/loading_dialog.dart';
import 'package:mediquest_mobile/managers/QuestionnaireManager.dart';
import 'package:mediquest_mobile/models/Patient.dart';
import 'package:mediquest_mobile/models/Questionnaire.dart';
import 'package:mediquest_mobile/screens/CreatePatient.dart';
import 'package:mediquest_mobile/screens/Questionaire.dart';
import 'package:mediquest_mobile/utils/GUIUtils.dart';

class PatientListScreen extends StatefulWidget {
  Questionnaire questionnaire;

  PatientListScreen(this.questionnaire);

  @override
  _PatientListScreenState createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  Animation<double> _animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Row(
          children: [
            Text("Survey Patients"),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
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
                  return SingleChildScrollView(
                    child: ListView.builder(
                      itemCount: snap.data.length,
                      primary: false,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        Patient patient = snap.data[index];

                        return Card(
                          child: ExpansionTile(
                            title: Text(
                              patient.initials,
                              style: TextStyle(
                                  fontSize: 13.0, fontWeight: FontWeight.bold),
                            ),
                            children: <Widget>[
                              ListTile(
                                title: SizedBox(
                                  height: 50,
                                  width: 350,
                                  child: SingleChildScrollView(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: FlatButton(
                                            child: Text("Questionnaire"),
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return QuestionnaireView(
                                                    patient);
                                              }));
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          child: FlatButton(
                                            child: Text(
                                              "Delete",
                                              style: TextStyle(
                                                  color: Colors.redAccent),
                                            ),
                                            onPressed: () async {
                                              LoadingDialog loadingDialog =
                                                  LoadingDialog(
                                                      buildContext: context,
                                                      loadingMessage:
                                                          "Deleting...");
                                              loadingDialog.show();
                                              Patient deletedPatient =
                                                  await QuestionnaireManager
                                                      .instance
                                                      .removePatient(
                                                          patient.id);
                                              loadingDialog.hide();
                                              if (deletedPatient != null) {
                                                setState(() {});
                                                CoolAlert.show(
                                                  context: context,
                                                  type: CoolAlertType.success,
                                                  confirmBtnText: "Yes",
                                                  text: "Patient deleted",
                                                );
                                              } else {
                                                CoolAlert.show(
                                                  context: context,
                                                  type: CoolAlertType.error,
                                                  confirmBtnText: "Yes",
                                                  text:
                                                      "Patient delete failed!",
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
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
          future: getQuestionnairePatients(widget.questionnaire.id),
        ),
      ),
      floatingActionButton: FloatingActionBubble(
        // Menu items
        items: <Bubble>[
          // Floating action menu item
          Bubble(
            title: "Add Patient",
            iconColor: Colors.white,
            bubbleColor: Colors.blue,
            icon: Icons.add,
            titleStyle: TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {
              _animationController.reverse();
              showCreatePatient(context, widget.questionnaire);
            },
          ),
          // Floating action menu item
          Bubble(
            title: "Clear All Patients",
            iconColor: Colors.white,
            bubbleColor: Colors.red,
            icon: Icons.clear,
            titleStyle: TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {
              _animationController.reverse();
              CoolAlert.show(
                context: context,
                type: CoolAlertType.confirm,
                confirmBtnText: "Yes",
                cancelBtnText: "Cancel",
                text: "Are you sure you want to clear patients!",
              );
            },
          ), //Floating action menu item
          Bubble(
            title: "Submit Patients",
            iconColor: Colors.white,
            bubbleColor: Colors.green,
            icon: Icons.send,
            titleStyle: TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {
              _animationController.reverse();
              CoolAlert.show(context: context, type: CoolAlertType.info);
            },
          ),
        ],

        // animation controller
        animation: _animation,

        // On pressed change animation state
        onPress: _animationController.isCompleted
            ? _animationController.reverse
            : _animationController.forward,

        // Floating Action button Icon color
        iconColor: Colors.blue,

        // Flaoting Action button Icon
        icon: AnimatedIcons.add_event,
      ),
      //   floatingActionButton: FabCircularMenu(
      //       fabOpenColor: Colors.red,
      //       ringDiameter: 200,
      // fabColor: Colors.red,
      // children: <Widget>[
      // IconButton(icon: FaIcon(FontAwesomeIcons.plus), onPressed: () {
      //   showDialog(
      //     context: context,
      //     barrierDismissible: true,
      //     builder: (context) {
      //       return CreatePatient();
      //     },
      //   );
      //
      // }),
      // IconButton(icon: Icon(Icons.clear,size: 35,), onPressed: () {
      //   CoolAlert.show(
      //     context: context,
      //     type: CoolAlertType.confirm,
      //     confirmBtnText: "Yes",
      //     cancelBtnText: "Cancel",
      //     text: "Are you sure you want to clear patients!",
      //   );
      // })
      // ]
      // ),
    );
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }
}

Future<List<Patient>> getQuestionnairePatients(int patientId) async {
  print("getting patients");
  List<Patient> patients = List();

  patients = await QuestionnaireManager().getQuestionnairePatients(patientId);

  if (patients != null && patients.isNotEmpty) {
    print("on data return patients list not empty");
    return patients;
  } else {
    print(" on data return patients  list empty ");
  }
}

Future<Patient> removePatient(Patient patientData, BuildContext context) async {
  LoadingDialog loadingDialog =
  LoadingDialog(buildContext: context, loadingMessage: "Removing...");
  loadingDialog.show();

  Patient patient = await QuestionnaireManager().removePatient(patientData.id);
  loadingDialog.hide();
  if (patient != null) {
    EdgeAlert.show(context,
        title: 'Success',
        description: 'Patient removed.',
        icon: Icons.check_circle_outline,
        backgroundColor: Colors.green,
        gravity: EdgeAlert.TOP);
  } else {
    {
      EdgeAlert.show(context,
          title: 'Failure',
          description: 'Failed to remove patient.',
          icon: Icons.dangerous,
          backgroundColor: Colors.red,
          gravity: EdgeAlert.TOP);
    }
  }
  return patient;
}

YYDialog showCreatePatient(BuildContext context, Questionnaire questionnaire) {
  return YYDialog().build(context)
    ..width = screenHeight(context) * 0.6
  //..height = screenWidth(context)*0.99
    ..backgroundColor = Colors.blueGrey
    ..borderRadius = 10.0
    ..showCallBack = () {
      print("showCallBack invoke");
    }
    ..dismissCallBack = () {
      print("dismissCallBack invoke");
    }
    ..widget(CreatePatient(questionnaire))
    ..animatedFunc = (child, animation) {
      return ScaleTransition(
        child: child,
        scale: Tween(begin: 0.0, end: 1.0).animate(animation),
      );
    }
    ..show();
}

