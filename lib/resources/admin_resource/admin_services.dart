import 'dart:convert';
import 'dart:developer';

import 'package:avua/core/strings.dart';
import 'package:avua/domain/admin/admin_login_response_model.dart';
import 'package:avua/domain/login_model/login_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class AdminServices {
  static Future<AdminLoginResponseModel?> adminLoginRequest(
      LoginModel loginModel, BuildContext context) async {
    String path = Urls.baseUrl + Urls.adminLogin;

    try {
      var url = Uri.parse(path);

      var response =
          await http.post(url, body: jsonEncode(loginModel.toJson()));

      log(response.body.toString(), name: "response data");
      // // log(jsonDecode(response.data).toString());
      // log(response.statusCode.toString());

      if (response.statusCode == 200) {
        // log(response.data.toString());
        final AdminLoginResponseModel inResponseModel =
            AdminLoginResponseModel.fromJson(jsonDecode(response.body));
        // if response is success , we are storing the access token in flutter secure storage
        // storage.write(key: "access_token", value: inResponseModel.access);
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Login Success")));
        // context.go(RoutesName.adminDashboard);
        return inResponseModel;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Entered email or password is incorrect")));
      }
    } catch (e) {
      // showSimpleNotification(const Text("email and password doesn't match"));
      log(e.toString(), name: "dio catch");
    }
    return null;
  }
}
