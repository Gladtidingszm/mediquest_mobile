import 'dart:convert';

import 'package:http/http.dart';
import 'package:mediquest_mobile/connectivity/ApiClient.dart';
import 'package:mediquest_mobile/payload/ApiPayload.dart';
import 'package:mediquest_mobile/payload/AuthenticationPayload.dart';
import 'package:mediquest_mobile/utils/GeneralUtils.dart';

class AuthenticationManager {
  Future<AuthenticationPayload> login(String username, String password) async {
    print("logging in");
    AuthenticationPayload authenticationPayload;

    Response response = await ApiClient().login(username, password);
    print(response.statusCode);
    if (response != null &&
        response.body != null &&
        GeneralUtils.isSuccess(response.statusCode)) {
      //decode the data
      print("response not null, decoding login ");
      Map<String, dynamic> data = jsonDecode(response.body.toString());
      ApiPayload payload = ApiPayload.fromJson(data);

      if (payload.success) {
        print("payload success");
        print("converting");
        print(payload.toJson());
        authenticationPayload = AuthenticationPayload.fromJson(payload.payload);

        if (authenticationPayload != null) {
          print("login  not null ");
        } else {
          print("login null ");
        }
      } else {
        print("payload failed:  " + payload.message);
      }
    } else {
      print("null  response");
    }
    return authenticationPayload;
  }
}
