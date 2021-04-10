import 'dart:convert';

import 'package:http/http.dart';
import 'package:mediquest_mobile/connectivity/ApiClient.dart';
import 'package:mediquest_mobile/models/Patient.dart';
import 'package:mediquest_mobile/models/Question.dart';
import 'package:mediquest_mobile/models/Questionnaire.dart';
import 'package:mediquest_mobile/payload/ApiPayload.dart';
import 'package:mediquest_mobile/utils/GeneralUtils.dart';

class QuestionnaireManager {
  static final instance = QuestionnaireManager();

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
        print("***********************************");
        print(response.statusCode);
        print("***********************************");

        data = jsonDecode(response.body.toString());

        payload = ApiPayload.fromJson(data);
      } catch (e) {
        print("HERE " + e.toString());
      }

      if (payload.success) {
        //convert
        print("converting");

        questionnaires = payload.payload
            .map<Questionnaire>((json) => Questionnaire.fromJson(json))
            .toList();
        print("length: " + questionnaires.length.toString());
        print(
            "******************************************************************");
        print(payload.payload);
        print(
            "*******************************************************************");
      } else {
        print("payload failed:  " + payload.message);
      }
    } else {
      print((response.statusCode));
    }
    return questionnaires;
  }

  Future<List<Questionnaire>> getStudentQuestionnaires() async {
    List<Questionnaire> questionnaires = List();
    Response response = await ApiClient.client.getStudentQuestionnaires();

    if (response != null &&
        response.body != null &&
        GeneralUtils.isSuccess(response.statusCode)) {
      //decode the data
      print("decoding");
      Map<String, dynamic> data;
      ApiPayload payload;

      try {
        print(response.body.toString());
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

  Future<List<Patient>> getQuestionnairePatients(int questionnaireId) async {
    List<Patient> patients = List();
    Response response =
    await ApiClient.client.getQuestionnairePatients(questionnaireId);

    if (response != null &&
        response.body != null &&
        GeneralUtils.isSuccess(response.statusCode)) {
      //decode the data
      print("decoding");
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
        print(payload.payload.toString());
        try {
          patients = payload.payload
              .map<Patient>((json) => Patient.fromJson(json))
              .toList();
        } catch (e) {
          print(e);
        }
        print("length: " + patients.length.toString());
      } else {
        print("payload failed:  " + payload.message);
      }
    } else {
      print((response.statusCode));
    }
    return patients;
  }

  Future<Patient> addPatient(Patient patient) async {
    print("creating patient");

    Response response = await ApiClient().addPatient(patient);
    print("after response" + response.statusCode.toString());

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
        print(payload.payload);

        if (patient != null) {
          print("patient not null  ");
          print("*******************************************");
          print(patient.toJson());
          print("*******************************************");
          return patient;
        } else {
          print("patient null ");
          return null;
        }
      } else {
        print("payload failed:  " + payload.message);
      }
    } else {
      print("null  response" + response.statusCode.toString());
    }
  }

  Future<Patient> removePatient(int patientId) async {
    print("removing patient");


    Response response = await ApiClient().removePatient(patientId);
    Patient patient;

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
      print(" response failed:   " + response?.statusCode.toString());
    }
    return patient;
  }

  Future<Questionnaire> clearQuestionnairePatients(int questionnaireID) async {
    print("clearing patients");

    Response response =
    await ApiClient().clearQuestionnairePatients(questionnaireID);
    Questionnaire questionnaire;

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
        questionnaire = Questionnaire.fromJson(payload.payload);

        if (questionnaire != null) {
          print("questionnaire not null  ");
        } else {
          print("questionnaire null ");
        }
      } else {
        print("payload failed:  " + payload.message);
      }
    } else {
      print("null  response");
    }
    return questionnaire;
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
