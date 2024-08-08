import 'package:bloc/bloc.dart';
import 'package:flutter_farabi_app/core/networking/auth_network.dart';
import 'package:meta/meta.dart';

part 'authorization_state.dart';

class AuthorizationCubit extends Cubit<AuthorizationState> {
  final AuthApi authApi;
  AuthorizationCubit(this.authApi) : super(AuthorizationInitial());

  Future<void> getAuth() async{

    emit(AuthorizationLoading());
    var response = await authApi.getAuth();
    if (response == "authorized") {
      emit(AuthorizationLoaded());
    }
    else {
      emit(AuthorizationError());
    }

  }
}
