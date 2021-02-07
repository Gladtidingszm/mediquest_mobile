import 'package:http/http.dart';
import 'package:mediquest_mobile/constants/Values.dart' as constants;
import 'package:mediquest_mobile/models/Patient.dart';
import 'package:mediquest_mobile/models/Submission.dart';

class ApiClient {
  Client _inner = Client();
  String _baseUrl = constants.baseUrl;

  Map<String, String> headers;
  static ApiClient client = ApiClient();

  Future<Response> getStudentAssignments(int studentId) async {
    String fullUrl = _baseUrl + "assignment/all/$studentId";
    print(fullUrl);
    Future<Response> response = _inner.get(fullUrl, headers: headers);
    return response;
  }

  Future<Response> getStudentQuestionnaires() async {
    String fullUrl = _baseUrl + "questionnaire/all";
    print(fullUrl);
    Future<Response> response = _inner.get(fullUrl, headers: headers);
    return response;
  }

  Future<Response> getQuestionnaireResponses(int questionnaireId) async {
    String fullUrl = _baseUrl + "questionnaire/submissions/$questionnaireId";
    Future<Response> response = _inner.get(fullUrl, headers: headers);
    return response;
  }

  Future<Response> getAllAssignments() async {
    String fullUrl = _baseUrl + "assignment/all";
    print(fullUrl);
    Future<Response> response = _inner.get(fullUrl, headers: headers);
    return response;
  }

  Future<Response> login(String username, String password) async {
    String fullUrl = _baseUrl + "student/login";
    print(fullUrl);

    Future<Response> response = _inner.post(fullUrl, headers: headers, body: {
      "email": username,
      "password": password,
    });
    return response;
  }

  Future<Response> getAllQuestions() async {
    String fullUrl = _baseUrl + "questions/all";
    print(fullUrl);
    Future<Response> response = _inner.get(fullUrl, headers: headers);
    return response;
  }

  Future<Response> getQuestionnairePatients(int questionnaireId) async {
    String fullUrl = _baseUrl + "questionnaire/patients/$questionnaireId";
    print(fullUrl);
    Future<Response> response = _inner.get(fullUrl, headers: headers);
    return response;
  }

  Future<Response> getAssignmentQuestionnaires(int assignmentId) async {
    String fullUrl = _baseUrl + "questionnaire/assignment-id/$assignmentId";
    print(fullUrl);
    Future<Response> response = _inner.get(fullUrl, headers: headers);
    return response;
  }

  Future<Response> removePatient(int patientId) async {
    String fullUrl = _baseUrl + "questionnaire/remove-patient/$patientId";
    print(fullUrl);
    Future<Response> response = _inner.get(fullUrl, headers: headers);
    return response;
  }

  Future<Response> addPatient(Patient patient) async {
    String fullUrl = _baseUrl + "questionnaire/add-patient";
    print(fullUrl);
    Map<String, dynamic> patientData = patient.toJson();

    _inner
        .post(Uri.parse(fullUrl), body: patientData)
        .then((Response response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.contentLength}");
      print(response.headers);
      print(response.body.toString());
      return response;
    });
  }

  Future<Response> submitPatientResponses(Submission submission) async {
    String fullUrl = _baseUrl + "questionnaire/submit";
    print(fullUrl);
    Map<String, dynamic> submissionData = submission.toJson();

    _inner
        .post(Uri.parse(fullUrl), body: submissionData)
        .then((Response response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.contentLength}");
      print(response.headers);
      print(response.body.toString());
      return response;
    });
  }
}
