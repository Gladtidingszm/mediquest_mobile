import 'package:edge_alert/edge_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_login/flutter_login.dart';
import 'package:mediquest_mobile/managers/AuthenticationManager.dart';
import 'package:mediquest_mobile/payload/StudentAuthPayload.dart';
import 'package:mediquest_mobile/screens/AssignmentList.dart';
import 'package:mediquest_mobile/utils/SharedPreferncesUtil.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/auth';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  StudentAuthPayload authenticationPayload;

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  Future<String> _loginUser(LoginData data) async {
    authenticationPayload =
        await AuthenticationManager.login(data.name, data.password);
    print("done");
    if (authenticationPayload != null &&
        authenticationPayload.student != null &&
        authenticationPayload.accessToken != null) {
      print(authenticationPayload.student.toJson());
      SharedPreferencesUtil.setCurrentStudent(authenticationPayload.student);
      SharedPreferencesUtil.setAuthToken(
          token: authenticationPayload.accessToken);
      print("auth token stored as:   " + SharedPreferencesUtil.getAuthToken());
    } else {}
  }

  Future<String> _register(String computerNumber, String password) async {
    authenticationPayload =
        await AuthenticationManager.register(computerNumber, password);
    print("done");
    if (authenticationPayload != null &&
        authenticationPayload.student != null &&
        authenticationPayload.accessToken != null) {
      print(authenticationPayload.student.toJson());
      SharedPreferencesUtil.setCurrentStudent(authenticationPayload.student);

      SharedPreferencesUtil.setAuthToken(
          token: authenticationPayload.accessToken);

      print("auth token stored as:   " +
          SharedPreferencesUtil.getAuthToken().toString());
    } else {
      print("login failed");
    }
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
      title: "LMMU",
      logo: 'assets/images/lmmu.png',

      logoTag: "Suit",
      titleTag: "Okay",

      emailValidator: (value) {
        if (value.isEmpty) {
          return "Please enter your computer number";
        }
        return null;
      },
      messages: LoginMessages(
        usernameHint: "Username",
      ),

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
        return _register(loginData.name, loginData.password);
      },
      onSubmitAnimationCompleted: () {
        print("animation complete");
        if (authenticationPayload != null &&
            authenticationPayload.student != null &&
            authenticationPayload.accessToken != null) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => AssignmentList(),
          ));
        } else {
          EdgeAlert.show(context,
              title: 'Failure',
              description: 'Failed to authenticate.',
              icon: Icons.dangerous,
              backgroundColor: Colors.red,
              gravity: EdgeAlert.TOP);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
        }
      },
      onRecoverPassword: (name) {
        print('Recover password info');
        print('Name: $name');
        return _recoverPassword(name);
        // Show new password dialog
      },

      // theme: LoginTheme(),
    );
  }
}