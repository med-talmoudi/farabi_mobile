// ignore_for_file: avoid_print

import 'package:flutter_farabi_app/core/exceptions/exceptions.dart';

import '../../../../core/networking/auth_network.dart';

class AuthRepository {
  final RegisterApi registerApi;

  AuthRepository(this.registerApi);

  Future<dynamic> registerUser(String phone) async {
    try {
      var response = await registerApi.registerUser(phone);

    
      return response;
    } on ServerException catch (e) {
      return e;
    } catch (_) {
      return "erreur inattendue";
    }
  }

  Future<dynamic> otpVerification(String phone, String otp) async {
    try {
      var response = await registerApi.otpVerification(phone, otp);
      if (response != "ok") {
        print(response);
        return response;
      } else {
        print(response);

        return response;
      }
    } on ServerException catch (e) {
      return e;
    } catch (_) {
      return "erreur inattendue";
    }
  }

  Future<dynamic> createAccount(String phone, String name, String lastName,
      String password, String date, String gender) async {
    try {
      var response = await registerApi.createAccount(
          phone, name, lastName, password, date, gender);

      if (response != "ok") {
        print(response);

        return response;
      } else {
        print(response);

        return response;
      }
    } on ServerException catch (e) {
      return e;
    } catch (_) {
      return "erreur inattendue!";
    }
  }

  Future<dynamic> resetPassword(String phone) async {
    try {
      var response = await registerApi.resetPassword("216$phone");

      if (response != "ok") {
        print(response);

        return response;
      } else {
        print(response);

        return response;
      }
    } on ServerException catch (e) {
      return e;
    } catch (_) {
      return "erreur inattendue!";
    }
  }

  Future<dynamic> resendOtp(String phone) async {
    try {
      var response = await registerApi.resendOtp(phone);

      if (response != "ok") {
        print(response);

        return response;
      } else {
        print(response);

        return response;
      }
    } on ServerException catch (e) {
      
      return e;
    } catch (e) {
    print(e);
      return "erreur inattendue!";
    }
  }


    Future<dynamic> userLogin(String phone, String password) async {
    try {
      var response = await registerApi.userLogin(phone, password);

      if (response != "ok") {
        print(response);

        return response;
      } else {
        print(response);

        return response;
      }
    } on ServerException catch (e) {
      
      return e;
    } catch (e) {
    print(e);
      return "erreur inattendue!";
    }
  }
}
