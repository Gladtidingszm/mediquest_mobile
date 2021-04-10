import 'dart:convert';

import 'package:http/http.dart';
import 'package:mediquest_mobile/connectivity/ApiClient.dart';
import 'package:mediquest_mobile/models/request/RegisterRequest.dart';
import 'package:mediquest_mobile/payload/ApiPayload.dart';
import 'package:mediquest_mobile/payload/StudentAuthPayload.dart';
import 'package:mediquest_mobile/utils/GeneralUtils.dart';
import 'package:mediquest_mobile/utils/SharedPreferncesUtil.dart';

class AuthenticationManager {
  static Future<bool> validateToken(String token) async {
    bool validToken = await ApiClient.validateToken(token: token);
    validToken ? print("valid token") : print("invalid token");
    return validToken;
  }

  static Future<StudentAuthPayload> login(
      String username, String password) async {
    print("logging in");
    StudentAuthPayload authenticationPayload;

    Response response = await ApiClient().login(username, password);

    if (response != null &&
        response.body != null &&
        GeneralUtils.isSuccess(response.statusCode)) {
      print(response.statusCode);
      //decode the data
      print("response not null, decoding login ");
      Map<String, dynamic> data = jsonDecode(response.body.toString());
      ApiPayload payload = ApiPayload.fromJson(data);

      if (payload.success) {
        print("payload success");
        print("converting");
        print(payload.toJson());
        authenticationPayload = StudentAuthPayload.fromJson(payload.payload);
        print(
            "***************************************************************************");

        print(authenticationPayload?.toJson());

        print(
            "***************************************************************************");

        if (authenticationPayload != null) {
          print("login  not null ");
          SharedPreferencesUtil.setAuthToken(
              token: authenticationPayload?.accessToken);
          SharedPreferencesUtil.setCurrentStudent(
              authenticationPayload.student);
        } else {
          print("login null ");
        }
      } else {
        print("payload failed:  " + payload.message);
      }
    } else {
      print("null  response");
      print(response?.statusCode);
    }
    return authenticationPayload;
  }

  static Future<StudentAuthPayload> register(
      String computerNumber, String password) async {
    print("signing up");
    RegisterRequest request =
        RegisterRequest(password: password, computerNumber: computerNumber);
    StudentAuthPayload authPayload;
    Response response = await ApiClient().register(request);

    if (response != null &&
        response.body != null &&
        GeneralUtils.isSuccess(response.statusCode)) {
      print(response.statusCode);
      //decode the data
      print("response not null, decoding sign up payload ");
      Map<String, dynamic> data = jsonDecode(response.body.toString());
      ApiPayload payload = ApiPayload.fromJson(data);

      if (payload.success) {
        print("payload success");
        print("converting");
        print(payload.toJson());
        authPayload = StudentAuthPayload.fromJson(payload.payload);
        print(
            "***************************************************************************");

        print(authPayload?.toJson());

        print(
            "***************************************************************************");

        if (authPayload != null) {
          print("sign up  not null ");
          SharedPreferencesUtil.setAuthToken(token: authPayload?.accessToken);
          SharedPreferencesUtil.setCurrentStudent(authPayload.student);
        } else {
          print("sign up null ");
        }
      } else {
        print("payload failed:  " + payload.message);
      }
    } else {
      print("null  response");
      print(response?.statusCode);
    }
    return authPayload;
  }


}
