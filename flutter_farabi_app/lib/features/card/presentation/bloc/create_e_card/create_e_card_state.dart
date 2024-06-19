part of 'create_e_card_cubit.dart';

@immutable
sealed class CreateECardState {}

final class CreateECardInitial extends CreateECardState {}
final class CreateECardLoading extends CreateECardState {}
final class CreateECardLoaded extends CreateECardState {}
final class CreateECardError extends CreateECardState {
  final String stringError;

  CreateECardError({required this.stringError});
}
