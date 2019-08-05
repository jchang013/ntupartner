import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';

import 'package:ntupartner/common/functions/showDialogWithSingleButton.dart';
import 'package:ntupartner/model/login_model.dart';
import 'package:ntupartner/model/user_model.dart';
import 'package:ntupartner/common/functions/saveCurrentLogin.dart';
import 'package:ntupartner/ui/mainpage.dart';

Future<UserModel> requestLoginAPI(BuildContext context, String username, String password) async {
  final url = "http://172.21.148.187:8000/accounts/authenticate/";
  final imageurl = "http://172.21.148.187:8000/accounts/image/";

  String _base64;

  var user;
  Uint8List bytesImage;

  Map<String, String> body = {
    'username': username,
    'password': password,
  };

  final response = await http.post(
    url,
    body: body,
  );

  final image = await http.post(
    imageurl,
    body: body,
  );

  if (image.statusCode == 200) {
    //File userAvatar = json.decode(image.body);
    String bytes = utf8.decode(image.bodyBytes);

    bytesImage = base64.decode(bytes);
    //user.setImageBytes = bytesImage;
    //user.setImage(userAvatar);
    print('image retrieved');
  }

  if (response.statusCode == 200) {   //Will have to add in other response code
    final responseJson = json.decode(response.body);
    user = new UserModel.fromJson(responseJson);
    user.setImageBytes = bytesImage;
    print('${user.fullname}');

    saveCurrentLogin(responseJson);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage(user: user)));

    return UserModel.fromJson(responseJson);
  } else if (response.statusCode == 400){ //Incorrect credentials
    final responseJson = json.decode(response.body);

    //saveCurrentLogin(responseJson);
    showDialogSingleButton(
        context,
        "Unable to Login",
        "You may have supplied an invalid username or password. Please try again or contact the administrators.",
        "Ok");
    return null;
    } else if (response.statusCode == 404){ //Page not found

    showDialogSingleButton(
        context,
        "Unable to Login",
        "Unable to reach server. Please try again later or contact the administrators.",
        "Ok");
  } else {  //Final case

    showDialogSingleButton(
        context,
        "Unable to Login",
        "Unknown Error. Please try again or contact the administrators.",
        "Ok");
  }
}