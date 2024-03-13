import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sport_app/repositories/auth/models/auth_model.dart';

class AuthRepository {
  Future<void> getUserData() async {
    const url = "http://10.0.0.2:5050/test_get";
    final response = await http.get(Uri.parse(url));
    final jsonData = jsonDecode(response.body);
    debugPrint(jsonData.toString());
  }

  Future<void> postUserData(AuthModel authModel) async {
    debugPrint('${authModel.toJson()}');
    const url = "http://10.0.0.2:5050/register";
    final String jsonString = jsonEncode(authModel);
    debugPrint(jsonString);
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonString,
      );
      print('Response status: ${response.statusCode}');
      print('Response data: ${response.body}');
    } catch (error) {
      print('Error: $error');
    }
  }
}
