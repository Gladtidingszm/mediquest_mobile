import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_login/flutter_login.dart';
import 'package:mediquest_mobile/Main.dart';
import 'package:mediquest_mobile/managers/AuthenticationManager.dart';
import 'package:mediquest_mobile/payload/StudentAuthPayload.dart';
import 'package:mediquest_mobile/utils/SharedPreferncesUtil.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/auth';

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  Future<String> _loginUser(LoginData data) async {
    StudentAuthPayload authenticationPayload =
    await AuthenticationManager().login(data.name, data.password);
    print("done");
    print(authenticationPayload.student.toJson());
    SharedPreferencesUtil.setCurrentStudent(authenticationPayload.student);
    SharedPreferencesUtil.setAuthToken(
        token: authenticationPayload.accessToken);
    print("auth token stored as:   " + SharedPreferencesUtil.getAuthToken());
  }

  Future<String> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      return 'Okay';
    });
  }

  @override
  void initState() {
    SharedPreferencesUtil.setAuthToken(token: null);
  }


  @override
  Widget build(BuildContext context) {
    final inputBorder = BorderRadius.vertical(
      bottom: Radius.circular(10.0),
      top: Radius.circular(20.0),
    );


    return FlutterLogin(
      title: "MediQuest",
      //  logo: 'assets/images/ecorp.png',
      logoTag: "Suit",
      titleTag: "Okay",

      emailValidator: (value) {
        if (!value.contains('@') | | !value.endsWith ('.com')
        ) {
        return "Email must contain '@' and end with '.com'";
        }
        return
        null;
      },
      passwordValidator: (value) {
        if (value.isEmpty) {
          return 'Password is empty';
        }
        return null;
      },
      onLogin: (loginData) {
        print('Login info');
        print('Name: ${loginData.name}');
        print('Password: ${loginData.password}');
        return _loginUser(loginData);
      },
      onSignup: (loginData) {
        print('Signup info');
        print('Name: ${loginData.name}');
        print('Password: ${loginData.password}');
        return _loginUser(loginData);
      },
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => MyApp(),
        ));
      },
      onRecoverPassword: (name) {
        print('Recover password info');
        print('Name: $name');
        return _recoverPassword(name);
        // Show new password dialog
      },
      showDebugButtons: false,
    );
  }
}