part of 'user_login_cubit.dart';

@immutable
sealed class UserLoginState {}

final class UserLoginInitial extends UserLoginState {}

final class UserLoginLoading extends UserLoginState {}

final class UserLoginLoaded extends UserLoginState {
  final String token;
  final bool hasCard;

  UserLoginLoaded({required this.token, required this.hasCard});
}

final class UserLoginError extends UserLoginState {
  final String stringError;

  UserLoginError({required this.stringError});
}
