part of 'phone_register_cubit.dart';

@immutable
sealed class PhoneRegisterState {}

final class PhoneRegisterInitial extends PhoneRegisterState {}
final class PhoneRegisterLoading extends PhoneRegisterState {}
final class PhoneRegisterLoaded extends PhoneRegisterState {
  final String stringStatus  ;

  PhoneRegisterLoaded({required this.stringStatus});
}
final class PhoneRegisterError extends PhoneRegisterState {
  final String stringError  ;

  PhoneRegisterError({required this.stringError});
}

