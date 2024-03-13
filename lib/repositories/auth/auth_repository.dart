import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sport_app/repositories/auth/models/auth_model.dart';

class AuthRepository {
  Future<void> getUserData() async {
    final response = await Dio().get('http://10.0.0.2:5050');
    debugPrint(response.toString());
    return response.data;
  }

  Future<void> postUserData(AuthModel authModel) async {
    try {
      final response =
          await Dio().post('http://10.0.0.2:5050', data: authModel.toJson());
      debugPrint('Response status: ${response.statusCode}');
      debugPrint('Response data: ${response.data}');
    } catch (error) {
      debugPrint('Error: $error');
    }
  }
}
