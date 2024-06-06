part of 'opt_verification_cubit.dart';

@immutable
sealed class OptVerificationState {}

final class OptVerificationInitial extends OptVerificationState {}

final class OptVerificationLoading extends OptVerificationState {}

final class OptVerificationLoaded extends OptVerificationState {}

final class OptVerificationError extends OptVerificationState {
  final String stringError;

  OptVerificationError({required this.stringError});
}
