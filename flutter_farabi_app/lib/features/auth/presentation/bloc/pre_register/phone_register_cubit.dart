

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repositories/auth_repository.dart';

part 'phone_register_state.dart';

class PhoneRegisterCubit extends Cubit<PhoneRegisterState> {
  final AuthRepository authRepository;
  PhoneRegisterCubit(this.authRepository) : super(PhoneRegisterInitial());

  Future<void> phoneRegister(String phone) async {
    emit(PhoneRegisterLoading());

    var response = await authRepository.registerUser(phone);
   
    if (response == "erreur inattendue") {
      emit(PhoneRegisterError(stringError: response.toString()));
     
    } else if (response.containsKey('errors')) {
      emit(PhoneRegisterError(stringError: response['errors'][0]['msg']));
    } else if (response.containsKey('status')) {
      emit(PhoneRegisterLoaded(stringStatus: response["status"].toString()));
    } else {
      emit(PhoneRegisterError(stringError: response.toString()));
    }
  }
}
