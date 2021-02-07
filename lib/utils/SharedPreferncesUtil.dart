import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mediquest_mobile/models/Student.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  static SharedPreferences _preferences;

  static Future initSharedPreferences() async {
    print("getting shared preferences");
    _preferences = await SharedPreferences.getInstance();
  }

  static void setCurrentStudent(Student student) {
    _preferences.setString("student", jsonEncode(student));
  }

  static Future<Student> getStudent() async {
    String studentJson = _preferences.getString("student");
    Student student = Student.fromJson(jsonDecode(studentJson));
    return student;
  }

  static void setAuthToken({@required String token}) async {
    _preferences.setString('userToken', token);
  }

  static Future<String> getAuthToken() async {
    String result = _preferences.getString('userToken');
    return result;
  }
}
