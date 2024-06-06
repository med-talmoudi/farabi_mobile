import 'package:bloc/bloc.dart';
import 'package:flutter_farabi_app/features/auth/data/repositories/auth_repository.dart';
import 'package:meta/meta.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AuthRepository authRepository;
  ResetPasswordCubit(this.authRepository) : super(ResetPasswordInitial());

  Future<void> resetPassword(String phone) async {
    emit(ResetPasswordLoading());
    var response = await authRepository.resetPassword(phone);
    if (response == "ok") {
      emit(ResetPasswordLoaded());
    } else {
      emit(ResetPasswordError(stringError: response.toString()));
    }
  }
}
