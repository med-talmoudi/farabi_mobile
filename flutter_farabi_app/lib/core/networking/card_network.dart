// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../main.dart';

class CardApi {
  late Dio dio;

 

  CardApi() {
    //  DependencyInjection.init();
    
    var token = box?.get("token");
    token ??= "null"; //TODO check token string null or value null

    final headers = <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
      "x-auth-token": token
    };
    final String apiUrl = dotenv.env['API_URL'].toString();
    BaseOptions options = BaseOptions(
      headers: headers,
      baseUrl: apiUrl,
      // baseUrl: "http://192.168.1.19:5000",
      receiveDataWhenStatusError: true,

      validateStatus: (status) {
        // Validate status codes: 200-299, 400, 401, 429
        return status! >= 200 && status < 300 ||
            status == 400 ||
             status == 404 ||
            status == 401 ||
            status == 429;
      },
      
      connectTimeout: const Duration(seconds: 50),
      receiveTimeout: const Duration(seconds: 50),
     
    );

    dio = Dio(options);
     dio.interceptors.add(PrettyDioLogger()); // TODO logger
  }

  

  Future<dynamic> getAuth() async {
    try {
      var response = await dio.get('/api/auth');
      final Map<String, dynamic> responseData =
          json.decode(response.toString());
      return CustomResponce(
          data: responseData, statusCode: response.statusCode!);
    } on DioException catch (error) {

      print( " --------------------------------------------${error.response}");
      return CustomResponce(
          data: null, statusCode: 500); // Return a 500 status code on error
    }
  }

  Future<dynamic> createECard() async {
    var response = await dio.post('/api/usercard/add-e-card');
    final Map<String, dynamic> responseData = json.decode(response.toString());

    if (response.statusCode == 200 || response.statusCode == 201) {
      return "ok";
    } else if (response.statusCode == 400) {
      final Map<String, dynamic> responseData =
          json.decode(response.toString());
      if (responseData.containsKey('errors')) {
        return responseData['errors'][0]['msg'];
      }
    }

    return responseData;
  }

  Future<dynamic> addCard(String cardNumber) async {
    var data = json.encode({"cardNumber": cardNumber}); // make an error
    var response = await dio.post('/api/usercard/add-card', data: data);
    final Map<String, dynamic> responseData = json.decode(response.toString());

    if (response.statusCode == 200 || response.statusCode == 201) {
      return "ok";
    } else if (response.statusCode == 400) {
      final Map<String, dynamic> responseData =
          json.decode(response.toString());
      if (responseData.containsKey('errors')) {
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
  
      var res= CustomResponce(
          data: responseData, statusCode: response.statusCode!);
      return res;
    } on DioException catch (error) {
      print("this is eeeeee ${error.response}");
      return CustomResponce(
          data: null, statusCode: 500); // Return a 500 status code on error
    }
  }

   Future<dynamic> getProfile() async {
    try {
      var response = await dio.get('/api/auth');
      final Map<String, dynamic> responseData =
          json.decode(response.toString());
      print(responseData);
      var res= CustomResponce(
          data: responseData, statusCode: response.statusCode!);
      return res;
    } on DioException catch (error) {
      print("this is eeeeee ${error.response}");
      return CustomResponce(
          data: null, statusCode: 500); // Return a 500 status code on error
    }
  }

  // else if (response.statusCode == 400) {
  //   final Map<String, dynamic> responseData =
  //       json.decode(response.toString());
  //   if (responseData.containsKey('errors')) {
  //
  //     return responseData['errors'][0]['msg'];
  //   }
  // }

  Future<dynamic> deleteCard() async {
    try {
      var response = await dio.delete('/api/usercard/delete-card');
      final Map<String, dynamic> responseData =
          json.decode(response.toString());
      return CustomResponce(
          data: responseData, statusCode: response.statusCode!);
    } on DioException catch (error) {

      print( " --------------------------------------------${error.response}");
      return CustomResponce(
          data: null, statusCode: 500); // Return a 500 status code on error
    }
  }


Future<dynamic> getJackpot() async {
    try {
      var response = await dio.get('/api/jackpot/jackpot');
      final Map<String, dynamic> responseData =
          json.decode(response.toString());
      return CustomResponce(
          data: responseData, statusCode: response.statusCode!);
    } on DioException catch (error) {

      print( " --------------------------------------------${error.response}");
      return CustomResponce(
          data: null, statusCode: 500); // Return a 500 status code on error
    }
  }
  // last 3
  Future<dynamic> getCardHistory() async {
    try {
      var response = await dio.get("/api/usercard/history?type=CARD&limit=3");
      final Map<String, dynamic> responseData =
          json.decode(response.toString());
      return CustomResponce(
          data: responseData, statusCode: response.statusCode!);
    } on DioException catch (error) {

      print( " --------------------------------------------${error.response}");
      return CustomResponce(
          data: null, statusCode: 500); // Return a 500 status code on error
    }
  }



  Future<dynamic> getJackpotHistory() async {
    try {
      var response = await dio.get("/api/usercard/history?type=JACKPOT&limit=3");
      final Map<String, dynamic> responseData =
          json.decode(response.toString());
      return CustomResponce(
          data: responseData, statusCode: response.statusCode!);
    } on DioException catch (error) {

      print( " --------------------------------------------${error.response}");
      return CustomResponce(
          data: null, statusCode: 500); // Return a 500 status code on error
    }
  }
  Future<dynamic> getJackpotHisto33ry() async {
    try {
      var response = await dio.get("/api/usercard/history?type=JACKPOT&limit=3");
      final Map<String, dynamic> responseData =
          json.decode(response.toString());
      return CustomResponce(
          data: responseData, statusCode: response.statusCode!);
    } on DioException catch (error) {

      print( " --------------------------------------------${error.response}");
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
