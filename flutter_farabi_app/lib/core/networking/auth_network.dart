// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_farabi_app/core/exceptions/exceptions.dart';

class AuthApi {
  late Dio dio;

  AuthApi() {
    final headers = <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json"
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

  Future<dynamic> registerUser(String phone) async {
    var data = json.encode({"phone": "216$phone"}); // make an error

    var response = await dio.post('/api/auth/register', data: data);
    final Map<String, dynamic> responseData = json.decode(response.toString());
    print(responseData);

    return responseData;
  }

  Future<dynamic> otpVerification(String phone, String otp) async {
    var data = json.encode({"verificationCode": otp}); // make an error

    var response = await dio.post('/api/auth/verify/216$phone', data: data);

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
  }

  Future<dynamic> createAccount(String phone, String name, String lastName,
      String password, String date, String gender) async {
    var data = json.encode({
      "firstname": name,
      "lastname": lastName,
      "gender": gender,
      "dateofbirth": date,
      "password": password
    });
    print(data.toString());
    print(phone); // make an error
    try {
      var response = await dio.post('/api/auth/continue-registration/216$phone',
          data: data);
        print(response.statusCode);
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
    } catch (e) {
      print("this the error in api $e");
      return "erreur inattendue!!";
    }
  }

  Future<dynamic> resetPassword(String phone) async {
    var data = json.encode({
      "phone": phone,
    });

    try {
      var response = await dio.put('/api/auth/sendpassword', data: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return "ok";
      } else {
        // final exceptionMessage = ErrorResponse.fromJson(
        //     json.decode(response.data) as Map<String, dynamic>);
        // throw ServerException(msg: exceptionMessage.errors[0].msg);

        final Map<String, dynamic> responseData =
            json.decode(response.toString());
        if (responseData.containsKey('errors')) {
          // If the response contains error messages, return the error message
          print(response.statusCode);
          print(responseData['errors'][0]['msg']);
          return responseData['errors'][0]['msg'];
        }
      }
    } catch (e) {
      print("this the error in api $e");
      return "erreur inattendue!";
    }
  }

  Future<dynamic> resendOtp(String phone) async {
    var response =
        await dio.post('/api/auth/resend-verification-code/216$phone');

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response);

      return "ok";
    } else if (response.statusCode == 400 || response.statusCode == 429) {
      final Map<String, dynamic> responseData =
          json.decode(response.toString());
      if (responseData.containsKey('errors')) {
        print(response.statusCode);
        print(responseData['errors'][0]['msg']);
        return responseData['errors'][0]['msg'];
      }
    }

    return "erreur inattendue!";
  }

  Future<dynamic> userLogin(String phone, String password) async {
    var data = json.encode({"phone": "216$phone", "password": password});
    try {
      var response = await dio.post('/api/auth', data: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> responseData =
            json.decode(response.toString());
        print(" this is login api $responseData");

        return responseData;
      } else if (response.statusCode == 400) {
        final Map<String, dynamic> responseData =
            json.decode(response.toString());
        if (responseData.containsKey('errors')) {
          print(response.statusCode);
          print(responseData);
          return responseData;
        }
      }
    } on ServerException catch (e) {
      return e;
    } catch (_) {
      return "erreur inattendue!";
    }
  }
}
