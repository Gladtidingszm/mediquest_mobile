import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mediquest_mobile/models/Student.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  static SharedPreferences _preferences;

  static Future initSharedPreferences() async {
    print("getting shared preferences");
    _preferences = await SharedPreferences.getInstance();
    print("gotten shared preferences ");
  }

  static void setCurrentStudent(Student student) {
    _preferences.setString("student", jsonEncode(student));
  }

  static Student getStudent() {
    String studentJson = _preferences.getString("student");
    Student student = Student.fromJson(jsonDecode(studentJson));
    return student;
  }

  static void setAuthToken({@required String token}) {
    _preferences.setString('userToken', token);
  }

  static String getAuthToken() {
    String result = _preferences.getString('userToken');
    return result;
  }
}
