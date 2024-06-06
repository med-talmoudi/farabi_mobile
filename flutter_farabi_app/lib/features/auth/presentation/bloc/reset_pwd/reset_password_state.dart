part of 'reset_password_cubit.dart';

@immutable
sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}
final class ResetPasswordLoading extends ResetPasswordState {}
final class ResetPasswordLoaded extends ResetPasswordState {}
final class ResetPasswordError extends ResetPasswordState {
  final String stringError  ;

  ResetPasswordError({required this.stringError});
}

