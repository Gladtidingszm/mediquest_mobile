import 'dart:convert';

import 'package:http/http.dart';
import 'package:mediquest_mobile/connectivity/ApiClient.dart';
import 'package:mediquest_mobile/models/Submission.dart';
import 'package:mediquest_mobile/payload/ApiPayload.dart';
import 'package:mediquest_mobile/utils/GeneralUtils.dart';

class SubmissionManager {
  Future<List<Submission>> getQuestionnaireResponses(
      int questionnaireId) async {
    print("submitting responses");
    List<Submission> submissions;

    Response response =
        await ApiClient().getQuestionnaireResponses(questionnaireId);

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
        submissions = payload.payload["submissions"]
            .map<Submission>((json) => Submission.fromJson(json))
            .toList();

        if (submissions != null && submissions.length > 0) {
          print("submissions  not null ");
        } else {
          print("submissions null ");
        }
      } else {
        print("payload failed:  " + payload.message);
      }
    } else {
      print("null  response");
    }
    return submissions;
  }
}
