import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'phone_input_field_state.dart';

class PhoneInputFieldCubit extends Cubit<PhoneInputFieldState> {
  PhoneInputFieldCubit() : super(PhoneInputFieldInitial());

  final RegExp tunisianPhoneNumberRegExp = RegExp(r'^[23459]\d{7}$');
  void phoneField(String phone) {
    if (phone.isEmpty) {
      emit(PhoneInputFieldInitial());
    } else if (phone.length != 8 ||
        !tunisianPhoneNumberRegExp.hasMatch(phone)) {
      emit(PhoneInputFieldInvalid());
    } else {
      emit(PhoneInputFieldValid());
    }
  }
   
}
