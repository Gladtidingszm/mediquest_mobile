import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

// so we're create a normal startup of a flutter application here
// so in our MyHomePage is where we're going to be working

class CreatePatient extends StatefulWidget {
  CreatePatient({Key key}) : super(key: key);

  @override
  _CreatePatientState createState() => _CreatePatientState();
}

class _CreatePatientState extends State<CreatePatient> {
  // So all this four controller's is for the textfield we're creating
  var _formKey = GlobalKey<ScaffoldState>(); // a scaffold Globalkey
  bool hidePass = true;

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
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: DropdownButtonFormField(
                          items: [
                            DropdownMenuItem(child: Text("Male")),
                            DropdownMenuItem(child: Text("Female"))
                          ],
                          decoration: InputDecoration(
                              icon: Icon(Icons.workspaces_filled)),
                          onChanged: (value) {},
                          hint: Text("Sex"),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Age',
                          icon: Icon(Icons.accessibility),
                        ),
                      ),
                      SizedBox(height: 10),

                      /* Column(
                         children: [
                           Text("Date of Birth"),
                           SizedBox(height: 15),
                           SizedBox(
                             height: 150,

                             child: CupertinoDatePicker(onDateTimeChanged: (newDate){

                             },
                               mode: CupertinoDatePickerMode.date,

                             ),
                           ),
                         ],
                       ),*/
                      FormBuilderDateTimePicker(
                        name: "here",
                        initialDatePickerMode: null,
                        initialEntryMode: DatePickerEntryMode.calendar,
                        decoration: InputDecoration(
                          icon: Icon(Icons.ac_unit_sharp),
                        ),
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
                              onPressed: () {
                                /* if (_formKey.currentState.saveAndValidate()) {
                          print(_formKey.currentState.value);
                        } else {
                          print(_formKey.currentState.value);
                          print('validation failed');
                        }*/
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
                                /* _formKey.currentState.reset();*/
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
    );
  }

  showandhide() {
    setState(() {
      hidePass = !hidePass;
    });
  }

  void _showInSnackBar({String message}) {
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
  }

  formValidate({String name, email, phn, pass, cpass}) {
    if (name.toString().isEmpty) {
      _showInSnackBar(message: 'Full name required');
    } else if (!email.toString().contains('@')) {
      _showInSnackBar(message: 'Invalid email address');
    } else if (phn.toString().isEmpty || phn.length != 11) {
      _showInSnackBar(message: 'Invalid phone number');
    } else if (pass.toString().isEmpty || pass.length != 8) {
      _showInSnackBar(message: '8 character required for password');
    } else if (cpass.toString() != pass.toString()) {
      _showInSnackBar(message: 'Password does not match');
    } else {
      openDia(name: name);
    }
  }

  openDia({String name}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('$name is now a verified account'),
            title: Text('Registration Successful'),
            actions: <Widget>[
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Verified',
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
