import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ntupartner/common/functions/showDialogWithSingleButton.dart';
import 'package:ntupartner/model/login_model.dart';
import 'package:ntupartner/common/functions/saveCurrentLogin.dart';
import 'package:ntupartner/ui/mainpage.dart';

Future<LoginModel> requestLoginAPI(BuildContext context, String username, String password) async {
  final url = "http://172.21.148.187:8000/accounts/login/";

  Map<String, String> body = {
    'username': username,
    'password': password,
  };

  final response = await http.post(
    url,
    body: body,
  );

  if (response.statusCode == 200) {   //Will have to add in other response code
    final responseJson = json.decode(response.body);
    var user = new LoginModel.fromJson(responseJson);
    print('$user');
    saveCurrentLogin(responseJson);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage()));

    return LoginModel.fromJson(responseJson);
  } else {
    final responseJson = json.decode(response.body);

    saveCurrentLogin(responseJson);
    showDialogSingleButton(
        context,
        "Unable to Login",
        "You may have supplied an invalid username or password. Please try again or contact the administrators.",
        "Ok");
    return null;
    }
}