part of 'user_login_cubit.dart';

@immutable
sealed class UserLoginState {}

final class UserLoginInitial extends UserLoginState {}

final class UserLoginLoading extends UserLoginState {}

final class UserLoginLoaded extends UserLoginState {
  final String token;

  UserLoginLoaded({required this.token});
}

final class UserLoginError extends UserLoginState {
  final String stringError;

  UserLoginError({required this.stringError});
}
