import 'dart:convert';

import 'package:http/http.dart';
import 'package:mediquest_mobile/connectivity/ApiClient.dart';
import 'package:mediquest_mobile/models/Patient.dart';
import 'package:mediquest_mobile/models/Question.dart';
import 'package:mediquest_mobile/models/Questionnaire.dart';
import 'package:mediquest_mobile/models/Submission.dart';
import 'package:mediquest_mobile/payload/ApiPayload.dart';
import 'package:mediquest_mobile/utils/GeneralUtils.dart';

class QuestionnaireManager {
  Future<List<Questionnaire>> getAssignmentQuestionnaires(
      int assignmentId) async {
    List<Questionnaire> questionnaires = List();
    Response response =
        await ApiClient.client.getAssignmentQuestionnaires(assignmentId);

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

        questionnaires = payload.payload
            .map<Questionnaire>((json) => Questionnaire.fromJson(json))
            .toList();
        print("length: " + questionnaires.length.toString());
      } else {
        print("payload failed:  " + payload.message);
      }
    } else {
      print((response.statusCode));
    }
    return questionnaires;
  }

  Future<Patient> addPatient(Patient patient) async {
    print("creating patient");

    Response response = await ApiClient().addPatient(patient);

    if (response != null &&
        response.body != null &&
        GeneralUtils.isSuccess(response.statusCode)) {
      //decode the data
      print("decoding  ");
      Map<String, dynamic> data = jsonDecode(response.body.toString());
      ApiPayload payload = ApiPayload.fromJson(data);
      if (payload.success) {
        print("payload success");
        print("converting");
        patient = Patient.fromJson(payload.payload);

        if (patient != null) {
          print("patient not null  ");
        } else {
          print("patient null ");
        }
      } else {
        print("payload failed:  " + payload.message);
      }
    } else {
      print("null  response");
    }
    return patient;
  }

  Future<Patient> removePatient(int patientId) async {
    print("removing patient");

    Response response = await ApiClient().removePatient(patientId);
    Patient patient = null;

    if (response != null &&
        response.body != null &&
        GeneralUtils.isSuccess(response.statusCode)) {
      //decode the data
      print("decoding  ");
      Map<String, dynamic> data = jsonDecode(response.body.toString());
      ApiPayload payload = ApiPayload.fromJson(data);
      if (payload.success) {
        print("payload success");
        print("converting");
        patient = Patient.fromJson(payload.payload);

        if (patient != null) {
          print("patient not null  ");
        } else {
          print("patient null ");
        }
      } else {
        print("payload failed:  " + payload.message);
      }
    } else {
      print("null  response");
    }
    return patient;
  }

  Future<Submission> submitPatientResponses(
    Submission submission,
  ) async {
    print("submitting responses");

    Response response = await ApiClient().submitPatientResponses(submission);

    if (response != null &&
        response.body != null &&
        GeneralUtils.isSuccess(response.statusCode)) {
      //decode the data
      print("decoding ");
      Map<String, dynamic> data = jsonDecode(response.body.toString());
      ApiPayload payload = ApiPayload.fromJson(data);
      if (payload.success) {
        print("payload success");
        print("converting");
        submission = payload.payload["submission"].fromJson(json);

        if (submission != null) {
          print("submission  not null ");
        } else {
          print("submission null ");
        }
      } else {
        print("payload failed:  " + payload.message);
      }
    } else {
      print("null  response");
    }
    return submission;
  }

  Future<List<Question>> getAllQuestions() async {
    List<Question> questions = List();
    Response response = await ApiClient.client.getAllQuestions();

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

        questions = payload.payload
            .map<Question>((json) => Question.fromJson(json))
            .toList();
        print("length: " + questions.length.toString());
      } else {
        print("payload failed:  " + payload.message);
      }
    } else {
      print((response.statusCode));
    }
    return questions;
  }
}
