

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repositories/auth_repository.dart';

part 'opt_verification_state.dart';

class OptVerificationCubit extends Cubit<OptVerificationState> {
  final AuthRepository authRepository;
  OptVerificationCubit(this.authRepository) : super(OptVerificationInitial());

  Future<void> otpVerification(String phone, String otp) async {
    emit(OptVerificationLoading());
    
    var response = await authRepository.otpVerification(phone, otp);
    if (response == "ok") {
      emit(OptVerificationLoaded());
    
    } else {
      emit(OptVerificationError(stringError: response.toString()));
      
    }
  }
}
