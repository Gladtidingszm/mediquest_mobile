import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:loading_dialog/loading_dialog.dart';
import 'package:mediquest_mobile/managers/QuestionnaireManager.dart';
import 'package:mediquest_mobile/models/Patient.dart';
import 'package:mediquest_mobile/utils/DummyData.dart';

// so we're create a normal startup of a flutter application here
// so in our MyHomePage is where we're going to be working

class CreatePatient extends StatefulWidget {
  CreatePatient({Key key}) : super(key: key);

  @override
  _CreatePatientState createState() => _CreatePatientState();
}

class _CreatePatientState extends State<CreatePatient> {
  // So all this four controller's is for the textfield we're creating
  final _formKey = new GlobalKey<FormState>();
  bool hidePass = true;
  String _initials;
  DateTime dateOfBirth = DateTime(1900, 12, 12);
  String _sex;
  int age;

  // this is a boolean called hidePass we're going to use it for show and hide password
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
          ),
          body: Card(
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
                        'Patient Registration',
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
                              labelText: 'initials',
                              icon: Icon(Icons.mail),
                            ),
                            validator: (value) => value.isEmpty
                                ? 'Initials can\'t be empty'
                                : null,
                            onSaved: (value) => _initials = value.trim(),
                          ),
                          SizedBox(height: 10),
                          //sex
                          Container(
                            child: FormBuilderRadioGroup(
                              options: [
                                FormBuilderFieldOption(value: "Male"),
                                FormBuilderFieldOption(value: "Female"),
                              ],
                              initialValue: "",
                              decoration: InputDecoration(
                                  icon: Icon(Icons.workspaces_filled)),
                              onSaved: (value) {
                                _sex = value;
                              },
                              validator: (value) {
                                return value.toString().isEmpty
                                    ? "Sex can\'t be null"
                                    : null;
                              },
                            ),
                          ),
                          SizedBox(height: 10),
                          //age
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Age',
                              icon: Icon(Icons.accessibility),
                            ),
                            onSaved: (value) => _sex = value,
                            validator: (value) =>
                                value.isEmpty ? 'Age can\'t be empty' : null,
                          ),
                          SizedBox(height: 10),

                          //DOB
                          FormBuilderDateTimePicker(
                            name: "here",
                            onSaved: (value) => dateOfBirth = value,
                            initialDatePickerMode: null,
                            initialEntryMode: DatePickerEntryMode.calendar,
                            decoration: InputDecoration(
                              icon: Icon(Icons.ac_unit_sharp),
                            ),
                            validator: (value) => value == null
                                ? 'Date of birth can\'t be empty'
                                : null,
                          ),
                          SizedBox(height: 10),
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
                                      print(_formKey.currentState);

                                      LoadingDialog loading = LoadingDialog(
                                          buildContext: context,
                                          loadingMessage: "Creating ");
                                      loading.show();
                                      Patient patient =
                                          await QuestionnaireManager()
                                              .addPatient(Patient(
                                                  1,
                                                  DummyData.questionaire,
                                                  "OK",
                                                  DateTime.now(),
                                                  age,
                                                  _sex,
                                                  DummyData.institution,
                                                  DateTime.now(),
                                                  DateTime.now()));
                                      print(patient.toJson());
                                      loading.hide();
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
      ),
    );
  }

  showandhide() {
    setState(() {
      hidePass = !hidePass;
    });
  }

/*  void _showInSnackBar({String message}) {
    _formKey.currentState.showSnackBar(
      SnackBar(
        content: GestureDetector(
          onTap: () {},
          child: Text(
            message,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        duration: (Duration(seconds: 4)),
        elevation: 0,
        backgroundColor: Colors.black,
      ),
    );
  }*/

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
