import 'dart:convert' as convert;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mediquest_mobile/constants/Values.dart' as constants;
import 'package:mediquest_mobile/models/Patient.dart';
import 'package:mediquest_mobile/models/SubmissionAnswer.dart';
import 'package:mediquest_mobile/models/request/SubmissionRequestBody.dart';
import 'package:mediquest_mobile/payload/ApiPayload.dart';
import 'package:mediquest_mobile/utils/SharedPreferncesUtil.dart';

class ApiClient {
  final Client _inner = Client();
  String _baseUrl = constants.baseUrl;

  Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Authorization': 'authTest',
    'device': 'unknown',
    'Accept': 'application/json',
  };
  static ApiClient client = ApiClient();

  Future<void> _populateHeaders({@required String userToken}) async {
    // _headers['Content-Type'] = 'application/json';
    _headers['Accept'] = 'application/json';

    if (userToken != null) {
      _headers['Authorization'] = 'Bearer $userToken';
    }

    if (Platform.isAndroid) {
      _headers['device'] = 'android';
    } else if (Platform.isIOS) {
      _headers['device'] = 'iOS';
    }
  }

  Future<Response> getStudentAssignments(int studentId) async {
    String fullUrl = _baseUrl + "assignment/all/$studentId";
    _populateHeaders(userToken: SharedPreferencesUtil.getAuthToken());
    print(fullUrl);
    Future<Response> response = _inner.get(fullUrl, headers: _headers);
    return response;
  }

  Future<Response> getSubmissionAnswers(int submissionId) async {
    String fullUrl = _baseUrl + "submission/answers/$submissionId";
    _populateHeaders(userToken: SharedPreferencesUtil.getAuthToken());
    print(fullUrl);
    Future<Response> response = _inner.get(fullUrl, headers: _headers);
    return response;
  }

  Future<Response> clearQuestionnairePatients(int questionnaireId) async {
    String fullUrl = _baseUrl + "questionnaire/clear-patients/$questionnaireId";
    _populateHeaders(userToken: SharedPreferencesUtil.getAuthToken());
    print(fullUrl);
    Future<Response> response = _inner.get(fullUrl, headers: _headers);
    return response;
  }

  Future<Response> approveSubmission(int submissionId) async {
    String fullUrl = _baseUrl + "submission/approve/$submissionId";
    _populateHeaders(userToken: SharedPreferencesUtil.getAuthToken());
    print(fullUrl);
    Future<Response> response = _inner.post(fullUrl, headers: _headers);
    return response;
  }

  Future<Response> rejectSubmission(int submissionId) async {
    String fullUrl = _baseUrl + "submission/reject/$submissionId";
    _populateHeaders(userToken: SharedPreferencesUtil.getAuthToken());
    print(fullUrl);
    Future<Response> response = _inner.post(fullUrl, headers: _headers);
    return response;
  }

  Future<Response> getStudentQuestionnaires() async {
    String fullUrl = _baseUrl + "questionnaires/all";
    _populateHeaders(userToken: SharedPreferencesUtil.getAuthToken());

    print(fullUrl);
    Future<Response> response = _inner.get(fullUrl, headers: _headers);
    return response;
  }

  Future<Response> getQuestionnaireResponses(int questionnaireId) async {
    String fullUrl = _baseUrl + "questionnaire/submissions/$questionnaireId";
    _populateHeaders(userToken: SharedPreferencesUtil.getAuthToken());
    Future<Response> response = _inner.get(fullUrl, headers: _headers);
    return response;
  }

  Future<Response> getAllAssignments() async {
    String fullUrl = _baseUrl + "assignment/all";
    print(fullUrl);
    Future<Response> response = _inner.get(fullUrl, headers: _headers);
    return response;
  }

  Future<Response> login(String username, String password) async {
    String fullUrl = _baseUrl + "student/login";
    print(fullUrl);

    Future<Response> response = _inner.post(fullUrl, headers: _headers, body: {
      "email": username,
      "password": password,
    });
    return response;
  }

  Future<Response> getAllQuestions() async {
    String fullUrl = _baseUrl + "questions/all";
    _populateHeaders(userToken: SharedPreferencesUtil.getAuthToken());
    print(fullUrl);
    Future<Response> response = _inner.get(fullUrl, headers: _headers);
    return response;
  }

  Future<Response> getQuestionnairePatients(int questionnaireId) async {
    String fullUrl = _baseUrl + "patients/questionnaire/$questionnaireId";
    print(fullUrl);
    Future<Response> response = _inner.get(fullUrl, headers: _headers);
    return response;
  }

  Future<Response> getAssignmentQuestionnaires(int assignmentId) async {
    String fullUrl = _baseUrl + "questionnaire/assignment-id/$assignmentId";
    print(fullUrl);
    Future<Response> response = _inner.get(fullUrl, headers: _headers);
    return response;
  }

  Future<Response> removePatient(int patientId) async {
    String fullUrl = _baseUrl + "questionnaire/remove-patient/$patientId";
    _populateHeaders(userToken: SharedPreferencesUtil.getAuthToken());
    print(fullUrl);
    Future<Response> response = _inner.get(fullUrl, headers: _headers);
    return response;
  }

  Future<Response> addPatient(Patient patient) async {
    String fullUrl = _baseUrl + "patient/add";
    print(fullUrl);
    _populateHeaders(userToken: SharedPreferencesUtil.getAuthToken());

    print("************************************00");
    print(convert.JsonEncoder().convert(patient));

    print("************************************00");
    // Patient patientData = Patient.fromJson("");
    // print("Patient data: "+patientData.toString());
    Map<String, dynamic> map = {
      "questionnaire_id": patient.questionnaireId.toString(),
      "initials": patient.initials,
      "age": patient.age.toString(),
      "sex": patient.sex,
      "dob": patient.dob,
      "institution_id": patient.institutionId.toString(),
      "updated_at": DateTime.now().toString(),
      "created_at": DateTime.now().toString(),
      "id": "none"
    };
    var response = await _inner.post(fullUrl, headers: _headers, body: map);
    print(response.body);
    print(response.body);
    return response;
  }

  Future<List<SubmissionAnswer>> submitPatientResponses(
      {@required SubmissionRequestBody submission}) async {
    print('Submission Api');
    List<SubmissionAnswer> answers = List();

    _populateHeaders(userToken: SharedPreferencesUtil.getAuthToken());
    try {
      //var endPoint = _baseUrl+'questionnaire/submit';
      var endPoint = '${_baseUrl}questionnaire/submit';
      print(endPoint);
      print(_headers);
      print(convert.JsonEncoder().convert(submission));
      var response = await _inner
          .post(endPoint,
              headers: _headers,
              body: convert.JsonEncoder().convert(submission))
          .timeout(Duration(seconds: 30));

      if (response.statusCode == 201) {
        print("*************");

        print("SUCCESS");
        print("*************");
        print(response.statusCode);
        print("*************");

        var payload = ApiPayload.fromJson(convert.json.decode(response.body));

        answers = payload.payload
            .map<SubmissionAnswer>((json) => SubmissionAnswer.fromJson(json))
            .toList();
        print("length: " + answers.length.toString());

        return answers;
      } else {
        print(response.statusCode);
        print(response.body);
      }
    } catch (e) {
      print(e);
    }

    return answers;
  }
}

