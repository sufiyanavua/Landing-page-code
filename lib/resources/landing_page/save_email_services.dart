import 'dart:convert';
import 'dart:developer';

import 'package:avua/core/strings.dart';
import 'package:avua/domain/email_response_model/email_response_model.dart';
import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class SaveEmail {
  // final Dio _dio = Dio();

  Future<EmailResponseModel?> saveEmailToDatabase(
      String email, BuildContext context) async {
    String path = Urls.baseUrl + Urls.saveEmail + email;
    try {
      var url = Uri.parse(path);

      var response = await http.post(url);
      log(response.body.toString());
      if (response.statusCode == 200) {
        EmailResponseModel emailResponseModel =
            EmailResponseModel.fromJson(jsonDecode(response.body));
        log(emailResponseModel.msg);

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Thank you! You will hear from us soon.'),
            ),
          );
        }
      } else {
        log('POST request failed with status: ${response.statusCode}');
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Thank you! You will hear from us soon.'),
            ),
          );
        }
      }
    } catch (e) {
      log(e.toString(), name: "save email error");
    }
    return null;
  }
}
