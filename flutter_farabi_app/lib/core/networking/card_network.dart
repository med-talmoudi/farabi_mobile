// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../main.dart';

class CardApi {
  late Dio dio;

  CardApi() {
    final headers = <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
      "x-auth-token": box!.get("token")
    };
     final String apiUrl =  dotenv.env['API_URL'].toString();
    BaseOptions options = BaseOptions(
      headers: headers,
      baseUrl: apiUrl, 
      // baseUrl: "http://192.168.1.19:5000",
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

  Future<dynamic> addCard(String cardNumber) async {
    var data = json.encode({"cardNumber": cardNumber}); // make an error
    var response = await dio.post('/api/usercard/add-card', data: data);
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

  Future<dynamic> cardDetails() async {
    try {
      var response = await dio.get('/api/usercard/user-card');
      final Map<String, dynamic> responseData =
          json.decode(response.toString());
      return CustomResponce(
          data: responseData, statusCode: response.statusCode!);
    } catch (error) {
      print(error);
      return CustomResponce(
          data: null, statusCode: 500); // Return a 500 status code on error
    }
  }

  // print(responseData);

  // else if (response.statusCode == 400) {
  //   final Map<String, dynamic> responseData =
  //       json.decode(response.toString());
  //   if (responseData.containsKey('errors')) {
  //     print(response.statusCode);
  //     print(responseData['errors'][0]['msg']);
  //     return responseData['errors'][0]['msg'];
  //   }
  // }


  Future<dynamic> deleteCard() async {
    
    try {
      var response = await dio.post('/api/usercard/delete-card');
      final Map<String, dynamic> responseData =
          json.decode(response.toString());
      return CustomResponce(
          data: responseData, statusCode: response.statusCode!);
    } catch (error) {
      print(error);
      return CustomResponce(
          data: null, statusCode: 500); // Return a 500 status code on error
    }
  }













}

class CustomResponce<T> {
  final T data;
  final int statusCode;

  CustomResponce({required this.data, required this.statusCode});
}
