import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:_http';
import 'dart:async';

import 'package:ntupartner/model/login_model.dart';
import 'package:ntupartner/common/functions/getToken.dart';
import 'package:ntupartner/common/functions/saveLogout.dart';

Future<LoginModel> requestLogoutAPI(BuildContext context) async {
  final url = "https://www.yoururl.com/logout";

  var token;

  await getToken().then((result) {
    token = result;
  });

  final response = await http.post(
    url,
    headers: {HttpHeaders.authorizationHeader: "Token $token"},
  );

  if (response.statusCode == 200) {
    saveLogout();
    return null;
  } else {
    saveLogout();
    return null;
  }
}