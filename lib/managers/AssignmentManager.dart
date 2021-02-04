import 'dart:convert';

import 'package:http/http.dart';
import 'package:mediquest_mobile/connectivity/ApiClient.dart';
import 'package:mediquest_mobile/models/Assignment.dart';
import 'package:mediquest_mobile/payload/ApiPayload.dart';
import 'package:mediquest_mobile/utils/GeneralUtils.dart';

class AssignmentManager {
  Future<List<Assignment>> getStudentAssignments(int studentId) async {
    List<Assignment> assignments = List();
    Response response = await ApiClient.client.getStudentAssignments(studentId);

    if (response != null &&
        response.body != null &&
        GeneralUtils.isSuccess(response.statusCode)) {
      //decode the data

      Map<String, dynamic> data;
      ApiPayload payload;

      try {
        data = jsonDecode(response.body.toString());

        payload = ApiPayload.fromJson(data);
      } catch (e) {
        print(e.toString());
      }

      if (payload.success) {
        //convert
        print("converting");

        assignments = payload.payload
            .map<Assignment>((json) => Assignment.fromJson(json))
            .toList();
        print("length: " + assignments.length.toString());
      } else {
        print("payload failed:  " + payload.message);
      }
    } else {
      print((response.statusCode));
    }
    return assignments;
  }

  Future<List<Assignment>> getAllAssignments() async {
    List<Assignment> assignments = List();
    Response response = await ApiClient.client.getAllAssignments();

    if (response != null &&
        response.body != null &&
        GeneralUtils.isSuccess(response.statusCode)) {
      //decode the data

      Map<String, dynamic> data;
      ApiPayload payload;

      try {
        data = jsonDecode(response.body.toString());

        payload = ApiPayload.fromJson(data);
      } catch (e) {
        print(e.toString());
      }

      if (payload.success) {
        //convert
        print("converting");

        assignments = payload.payload
            .map<Assignment>((json) => Assignment.fromJson(json))
            .toList();
        print("length: " + assignments.length.toString());
      } else {
        print("payload failed:  " + payload.message);
      }
    } else {
      print((response.statusCode));
    }
    return assignments;
  }
}
