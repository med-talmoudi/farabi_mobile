part of 'authorization_cubit.dart';

@immutable
sealed class AuthorizationState {}

final class AuthorizationInitial extends AuthorizationState {}
final class AuthorizationLoading extends AuthorizationState {}
final class AuthorizationLoaded extends AuthorizationState {}
final class AuthorizationError extends AuthorizationState {
  

  AuthorizationError();
}