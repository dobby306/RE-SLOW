import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:reslow/models/user.dart';
import 'package:reslow/utils/shared_preference.dart';
// import 'package:jada/util/app_url.dart';

const String baseURL = "http://localhost:8080";

class AuthProvider with ChangeNotifier {



  Future<Map<String, dynamic>> login(String userId, String password) async {
    var result;
    final Map<String, dynamic> payload = {
      'data': {
        'userId': userId,
        'password': password
      }
    };


    Response response = await post(
      Uri.parse(baseURL),
      body: json.encode(payload),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      var userData = responseData['data'];

      User authUser = User.fromJson(userData);

      UserPreferences().saveUser(authUser);


      result = {'status': true, 'message': 'Successful', 'user': authUser};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> register(String userId, String password, String passwordConfirmation) async {
    var result;

    final Map<String, dynamic> payload = {
      'user': {
        'userId': userId,
        'password': password,
        'password_confirmation': passwordConfirmation
      }
    };
    Response response = await post(
        Uri.parse(baseURL),
        body: json.encode(payload),
        headers: {'Content-Type': 'application/json'})
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      var userData = responseData['data'];

      User authUser = User.fromJson(userData);

      UserPreferences().saveUser(authUser);


      result = {'status': true, 'message': 'Successful', 'user': authUser};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }


  static onError(error) {
    print("the error is $error.detail");
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }

}