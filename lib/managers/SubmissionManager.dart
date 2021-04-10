import 'dart:convert';

import 'package:http/http.dart';
import 'package:mediquest_mobile/connectivity/ApiClient.dart';
import 'package:mediquest_mobile/models/Submission.dart';
import 'package:mediquest_mobile/models/SubmissionAnswer.dart';
import 'package:mediquest_mobile/payload/ApiPayload.dart';
import 'package:mediquest_mobile/utils/GeneralUtils.dart';

class SubmissionManager {
  Future<List<SubmissionAnswer>> getSubmissionAnswers(int submissionId) async {
    print("getting submission answers");
    List<SubmissionAnswer> submissionAnswers;

    Response response = await ApiClient().getSubmissionAnswers(submissionId);

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
        submissionAnswers = payload.payload["answers"]
            .map<Submission>((json) => SubmissionAnswer.fromJson(json))
            .toList();

        if (submissionAnswers != null && submissionAnswers.length > 0) {
          print("submissionAnswers  not null ");
        } else {
          print("submissionAnswers null ");
        }
      } else {
        print("payload failed:  " + payload.message);
      }
    } else {
      print("null  response");
    }
    return submissionAnswers;
  }

  Future<Submission> approveSubmission(int submissionId) async {
    print("approving submission");

    Response response = await ApiClient().approveSubmission(submissionId);
    Submission submission;

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
        submission = Submission.fromJson(payload.payload);

        if (submission != null) {
          print("submission not null  ");
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

  static Future<List<Submission>> getAllSubmissions() async {
    print("getting submissions");
    List<Submission> submissions;

    Response response = await ApiClient.getAllSubmissions();

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

        try {
          submissions = payload.payload.map<Submission>((json) {
            Submission submission = Submission.fromJson(json);
            print("*****************************************************");
            print("${submission.toJson()}");
            print("*****************************************************");
            return submission;
          }).toList();
        } catch (e) {
          print(e);
        }

        if (submissions != null && submissions.length > 0) {
          print("submissions  not null len ${submissions.length} ");
          print("*****************************************************");
          // print("${payload.payload }");
          print("*****************************************************");
        } else {
          print("submissionAnswers null ");
        }
      } else {
        print("payload failed:  " + payload.message);
      }
    } else {
      print("null  response");
    }
    return submissions;
  }

  Future<Submission> rejectSubmission(int submissionId) async {
    print("rejecting submission");

    Response response = await ApiClient().rejectSubmission(submissionId);
    Submission submission;

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
        submission = Submission.fromJson(payload.payload);

        if (submission != null) {
          print("submission not null  ");
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
}
