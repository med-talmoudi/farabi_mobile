import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../main.dart';

class AuthApi {
  late Dio dio;

  AuthApi() {
    final headers = <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json"
    };
    final String apiUrl = dotenv.env['API_URL'].toString();

    BaseOptions options = BaseOptions(
      headers: headers,
      baseUrl: apiUrl, //ipconfig cmd
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
    dio = Dio(options);
     dio.interceptors.add(PrettyDioLogger());
  }

  Future<dynamic> registerUser(String phone) async {
    var data = json.encode({"phone": "216$phone"}); // make an error

    var response = await dio.post('/api/auth/register', data: data);
    final Map<String, dynamic> responseData = json.decode(response.toString());

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

    try {
      var response = await dio.post('/api/auth/continue-registration/216$phone',
          data: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return "ok";
      } else if (response.statusCode == 400) {
        final Map<String, dynamic> responseData =
            json.decode(response.toString());
        if (responseData.containsKey('errors')) {
          return responseData['errors'][0]['msg'];
        }
      }
    } catch (e) {
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

          return responseData['errors'][0]['msg'];
        }
      }
    } catch (e) {
      return "erreur inattendue!";
    }
  }

  Future<dynamic> resendOtp(String phone) async {
    var response =
        await dio.post('/api/auth/resend-verification-code/216$phone');

    if (response.statusCode == 200 || response.statusCode == 201) {
      return "ok";
    } else if (response.statusCode == 400 || response.statusCode == 429) {
      final Map<String, dynamic> responseData =
          json.decode(response.toString());
      if (responseData.containsKey('errors')) {
        return responseData['errors'][0]['msg'];
      }
    }

    return "erreur inattendue!";
  }

  Future<dynamic> userLogin(String phone, String password) async {
    var data = json.encode({"phone": "216$phone", "password": password});

    try {
      var response = await dio.post('/api/auth/login', data: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> responseData =
            json.decode(response.toString());

        return responseData;
      } else if (response.statusCode == 400) {
        final Map<String, dynamic> responseData =
            json.decode(response.toString());
        if (responseData.containsKey('errors')) {
          return responseData;
        }
      }
    } catch (_) {
      return "erreur inattendue!";
    }
  }
    // TODO delete this func
   Future<dynamic> getAuth() async {
    try {
     
      String? token = box!.get('token');
      if (token == null) {
        throw Exception('Token not found');
      }

      Options options = Options(
        headers: {
          "x-auth-token": token,
        },
      );

      var response = await dio.get('/api/auth', options: options);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return "authorized";
      } else {
        return "not authorized";
      }
    } catch (_) {
      return "erreur inattendue!";
    }
  }
}
