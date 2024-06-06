import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyPhoneNumberCubit extends Cubit<String> {
  VerifyPhoneNumberCubit() : super("");

  void updatePhoneNumber(String phoneNumber,) {
    if (phoneNumber.length <= 8) {
      emit(phoneNumber);
    }
  }
}
