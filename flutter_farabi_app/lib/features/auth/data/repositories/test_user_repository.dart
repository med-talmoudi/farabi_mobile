// // import 'package:flutter_farabi_app/core/networking/user_api.dart';
// // import 'package:flutter_farabi_app/features/sign_up/data/model/user.dart';

// // class UserRepository {
// //   final UserApi userApi;
   
// //   UserRepository(
// //     this.userApi,
// //   );

// //   Future<List<User>> getUser() async {
// //     final users = await userApi.registerUser();
// //     return users.map((user) => User.fromJson(user)).toList();
// //   }
// // }

// import 'package:flutter_farabi_app/core/networking/user_api.dart';


// import '../model/registration_response.dart';


// class RegistrationRepository {
//   final UserApi userApi;

//   RegistrationRepository(this.userApi);

//   Future<RegistrationResponse> registerUser() async {
//     final response = await userApi.registerUser();
//     return RegistrationResponse.fromJson(response as Map<String, dynamic>);
//   }
// }
