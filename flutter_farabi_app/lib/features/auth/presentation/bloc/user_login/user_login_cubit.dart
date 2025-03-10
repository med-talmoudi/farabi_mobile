

import 'package:bloc/bloc.dart';
import 'package:flutter_farabi_app/core/networking/auth_network.dart';
import 'package:meta/meta.dart';



part 'user_login_state.dart';

class UserLoginCubit extends Cubit<UserLoginState> {
  final AuthApi authApi;
  UserLoginCubit(this.authApi) : super(UserLoginInitial());

  Future<void> userLogin(String phone, String password) async {
    emit(UserLoginLoading());
    var response = await authApi.userLogin(phone, password);
    if (response == "erreur inattendue!") {
      
      emit(UserLoginError(stringError: "erreur inattendue!"));
    
    }
    
    else if (response.containsKey('token')) {
      if((response.containsKey('card')) && (response['card'].toString() != "null" )){
        print(" user have card");
        emit(UserLoginLoaded(token: response['token'].toString(), hasCard: true, fullName: "${response['firstname']} ${response['lastname']}"));
       
      }else{
          print(" user do not have card");
         emit(UserLoginLoaded(token: response['token'].toString(), hasCard: false, fullName: "${response['firstname']} ${response['lastname']}"));
       
      }
        
      
     
    } else {
      emit(UserLoginError(stringError: response['errors'][0]['msg']));
    }
  }
}
