import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mediquest_mobile/constants/Values.dart' as constants;
import 'package:mediquest_mobile/models/Patient.dart';
import 'package:mediquest_mobile/models/Questionnaire.dart';
import 'package:mediquest_mobile/models/SubmissionAnswer.dart';
import 'package:mediquest_mobile/models/request/LoginRequest.dart';
import 'package:mediquest_mobile/models/request/SubmissionRequestBody.dart';
import 'package:mediquest_mobile/payload/ApiPayload.dart';
import 'package:mediquest_mobile/utils/SharedPreferncesUtil.dart';

class ApiClient {
  static final Client _inner = Client();
  static String _baseUrl = constants.baseUrl;
  static final Duration _timeout = Duration(seconds: 20);

  static Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Authorization': 'authTest',
    'device': 'unknown',
    'Accept': 'application/json',
  };

  static Future<Response> getAllSubmissions() async {
    String fullUrl = _baseUrl + "student/submissions";
    _populateHeaders(userToken: SharedPreferencesUtil.getAuthToken());
    print(fullUrl);
    Future<Response> response = _inner.get(fullUrl, headers: _headers);
    return response;
  }

  static Future<void> _populateHeaders({@required String userToken}) async {
    // _headers['Content-Type'] = 'application/json';
    // _headers['Accept'] = 'application/json';

    if (userToken != null) {
      _headers['Authorization'] = 'Bearer $userToken';
    }

    if (Platform.isAndroid) {
      _headers['device'] = 'android';
    } else if (Platform.isIOS) {
      _headers['device'] = 'iOS';
    }
  }

  static ApiClient client = ApiClient();

  static Future<bool> validateToken({@required String token}) async {
    try {
      _populateHeaders(userToken: token);
      var endPoint = _baseUrl + 'validate-token';
      print(endPoint);
      print(_headers);
      var response =
          await _inner.get(endPoint, headers: _headers).timeout(_timeout);

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      print(e.toString());
    }

    return false;
  }

  Future<ApiPayload<AuthResponse>> signUp(
      {@required SignUpRequest request}) async {
    print('signUp Api');
    try {
      _populateHeaders(userToken: null);
      var endPoint = _baseUrl + 'auth/sign-up';
      print(endPoint);
      var response = await _apiClient
          .post(endPoint,
              headers: _headers, body: convert.JsonEncoder().convert(request))
          .timeout(_timeout);

      if (response.statusCode == 200) {
        print("*************");
        print(response.body);
        print("*************");

        var payload = ApiPayload.fromJson(convert.json.decode(response.body));

        var requestResponse = ApiPayload<AuthResponse>();
        if (payload.success) {
          requestResponse.payload = AuthResponse.fromJson(payload.payload);
        }
        requestResponse.message = payload.message;
        requestResponse.success = payload.success;

        return requestResponse;
      }
    } catch (e) {
      e.toString();
    }

    return null;
  }

  Future<Response> getStudentAssignments() async {
    String fullUrl = _baseUrl + "assignments/all";
    _populateHeaders(userToken: SharedPreferencesUtil.getAuthToken());
    print(fullUrl);
    print("==================HEADERS======================================");
    print(_headers);
    print("==================HEADERS======================================");
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
    LoginRequest loginRequest =
        LoginRequest(email: username, password: password);

    Future<Response> response = _inner.post(fullUrl,
        headers: _headers, body: convert.JsonEncoder().convert(loginRequest));
    return response;
  }

  Future<Response> register(RegisterRequest request) async {
    String fullUrl = _baseUrl + "student/sign-up";
    String token = SharedPreferencesUtil.getAuthToken();
    _populateHeaders(userToken: token);
    print(_headers);
    print(fullUrl);
    print("*******************************");
    print(request.toJson());
    print("******************************");
    Future<Response> response = _inner.post(fullUrl,
        headers: _headers, body: convert.JsonEncoder().convert(request));
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
    String fullUrl = _baseUrl + "questionnaires/all/$assignmentId";
    print(fullUrl);
    Future<Response> response = _inner.get(fullUrl, headers: _headers);
    return response;
  }

  Future<Response> removePatient(int patientId) async {
    String fullUrl = _baseUrl + 'patient/delete/$patientId';
    _populateHeaders(userToken: SharedPreferencesUtil.getAuthToken());
    print(fullUrl);
    Future<Response> response = _inner.delete(fullUrl, headers: _headers);
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
    var response = await _inner.post(fullUrl,
        headers: _headers, body: JsonEncoder().convert(patient));
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

  Future<List<SubmissionAnswer>> reSubmitPatientResponses(
      {@required SubmissionRequestBody submission}) async {
    print('RESubmission Api');
    print(submission?.toJson());
    List<SubmissionAnswer> answers = List();

    _populateHeaders(userToken: SharedPreferencesUtil.getAuthToken());
    try {
      //var endPoint = _baseUrl+'questionnaire/submit';
      var endPoint = '${_baseUrl}submissions/send-revision';
      print(endPoint);
      print(_headers);
      print(convert.JsonEncoder().convert(submission));
      var response = await _inner
          .put(endPoint,
              headers: _headers,
              body: convert.JsonEncoder().convert(submission))
          .timeout(Duration(seconds: 30));

      if (response.statusCode == 200) {
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

  Future<Questionnaire> fillInQuestionnaire(
      {@required Questionnaire questionnaire}) async {
    print('Filling in Questionnaire Api');

    _populateHeaders(userToken: SharedPreferencesUtil.getAuthToken());
    try {
      var endPoint = '${_baseUrl}questionnaire/create';
      print(endPoint);
      print(_headers);
      print("==========================PAYLOAD SEND=====================");
      print(convert.JsonEncoder().convert(questionnaire));
      print("==========================PAYLOAD SEND=====================");

      var response = await _inner
          .post(endPoint,
              headers: _headers,
              body: convert.JsonUtf8Encoder().convert(questionnaire))
          .timeout(Duration(seconds: 30));

      if (response != null) {
        if (response.statusCode == 201) {
          print("*************");
          print("SUCCESS");
          print("*************");
          print(response.body);
          print("*************");
          var payload = ApiPayload.fromJson(convert.json.decode(response.body));
          questionnaire = Questionnaire.fromJson(payload.payload);

          if (questionnaire != null) {
            print(
                "==========================PAYLOAD RETURN=====================");
            print(questionnaire.toString());
            print(
                "==========================PAYLOAD RETURN=====================");
            return questionnaire;
          } else {
            print("*************");
            print("NULL QUESTIONNAIRE");
            print("*************");
          }
        } else {
          print(response.statusCode);
          print(response.body);
        }
      } else {
        print("*************");
        print("NULL RESPONSE");
        print("*************");
      }
    } catch (e) {
      print(e);
    }

    return null;
  }
}

