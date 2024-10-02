part of 'get_auth_cubit.dart';

@immutable
sealed class GetAuthState {}

final class GetAuthInitial extends GetAuthState {}
final class GetAuthLoading extends GetAuthState {}
final class GetAuthLoaded extends GetAuthState {}
final class GetAuthError extends GetAuthState {}
