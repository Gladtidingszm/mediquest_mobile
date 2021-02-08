import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediquest_mobile/constants/AppRoutes.dart';
import 'package:mediquest_mobile/screens/Questionaire.dart';
import 'package:mediquest_mobile/screens/SubmissionsScreen.dart';

class AppNavigator {
  static navigateTo(String route, BuildContext context) {
    switch (route) {
      case AppRoute.SUBMISSIONS:
        _gotoScreen(SubmissionsScreen(), context);
        break;
      case AppRoute.QUESTIONNAIRE_VIEW:
        _gotoScreen(QuestionnaireView(), context);
    }
  }

  static _gotoScreen(Widget screen, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
  }
}
