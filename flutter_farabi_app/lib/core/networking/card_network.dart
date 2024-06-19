// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';

import '../../main.dart';

class CardApi {
  late Dio dio;

  CardApi() {
    final headers = <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
      "x-auth-token": box!.get("token")
    };
    BaseOptions options = BaseOptions(
      headers: headers,
      baseUrl: "http://192.168.1.19:5000", //ipconfig cmd
      receiveDataWhenStatusError: true,
      validateStatus: (status) {
        // Validate status code 400
        return status! >= 200 && status < 300 || status == 400 || status == 429;
      },
      connectTimeout: const Duration(seconds: 50),
      receiveTimeout: const Duration(seconds: 50),
    );

    dio = Dio(options);
  }

  Future<dynamic> getUser() async {
    var response = await dio.get('/api/auth');
    final Map<String, dynamic> responseData = json.decode(response.toString());
    // print(" this is what $responseData");

    return responseData;
  }

  Future<dynamic> createECard() async {
    var response = await dio.post('/api/usercard/add-e-card');
    final Map<String, dynamic> responseData = json.decode(response.toString());
    // print(responseData);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return "ok";
    } else if (response.statusCode == 400) {
      final Map<String, dynamic> responseData =
          json.decode(response.toString());
      if (responseData.containsKey('errors')) {
        print(response.statusCode);
        print(responseData['errors'][0]['msg']);
        return responseData['errors'][0]['msg'];
      }
    }

    return responseData;
  }
}
