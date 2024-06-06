import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repositories/auth_repository.dart';

part 'resend_otp_state.dart';

class ResendOtpCubit extends Cubit<ResendOtpState> {
  final AuthRepository authRepository;
  ResendOtpCubit(this.authRepository) : super(ResendOtpInitial());

    Future<void> resendOtp(String phone) async {
    emit(ResendOtpLoading());
    var response = await authRepository.resendOtp(phone);
    if (response == "ok") {
      emit(ResendOtpLoaded());
    } else {
      emit(ResendOtpError(stringError: response.toString()));
    }
  }
}
