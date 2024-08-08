part of 'get_username_cubit.dart';

@immutable
sealed class GetUsernameState {}

final class GetUsernameInitial extends GetUsernameState {}
final class GetUsernameLoading extends GetUsernameState {}
final class GetUsernameLoaded extends GetUsernameState {
  final String fullName;

  GetUsernameLoaded({required this.fullName});
}
final class GetUsernameError extends GetUsernameState {
  final String stringError;

  GetUsernameError({required this.stringError});
}