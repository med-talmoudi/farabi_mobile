// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:bloc/bloc.dart';


import 'package:meta/meta.dart';

import '../../../data/repositories/auth_repository.dart';

part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  final AuthRepository authRepository;
  CreateAccountCubit(this.authRepository)
      : super(CreateAccountInitial());

  Future<void> createAccount(String phone, String name, String lastName,
      String password, String date, String gender) async {
        print("before loading");
    emit(CreateAccountLoading());
    print("after loading");

    var response = await authRepository.createAccount(
        phone, name, lastName, password, date, gender);
      print("function is working");
    if (response == "ok") {
        print("account created");
      emit(CreateAccountLoaded());
    } else {
      emit(CreateAccountError(stringError: response.toString()));
        print("error on response");
    }
  }
}
