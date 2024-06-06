import 'package:bloc/bloc.dart';
import 'package:flutter_farabi_app/core/networking/auth_network.dart';
import 'package:meta/meta.dart';



part 'user_login_state.dart';

class UserLoginCubit extends Cubit<UserLoginState> {
  final RegisterApi registerApi;
  UserLoginCubit(this.registerApi) : super(UserLoginInitial());

  Future<void> userLogin(String phone, String password) async {
    emit(UserLoginLoading());
    var response = await registerApi.userLogin(phone, password);
    if (response.containsKey('token')) {
    
      emit(UserLoginLoaded(token: response['token'].toString()));
    } else {
      emit(UserLoginError(stringError: response['errors'][0]['msg']));
    }
  }
}
