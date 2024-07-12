part of 'phone_input_field_cubit.dart';

@immutable
sealed class PhoneInputFieldState {}

final class PhoneInputFieldInitial extends PhoneInputFieldState {}

final class PhoneInputFieldInvalid extends PhoneInputFieldState {}

final class PhoneInputFieldValid extends PhoneInputFieldState {}
