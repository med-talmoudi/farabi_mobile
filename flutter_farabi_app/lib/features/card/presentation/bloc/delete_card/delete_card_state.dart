part of 'delete_card_cubit.dart';

@immutable
sealed class DeleteCardState {}

final class DeleteCardInitial extends DeleteCardState {}
final class DeleteCardLoading extends DeleteCardState {}
final class DeleteCardLoaded extends DeleteCardState {}
final class DeleteCardError extends DeleteCardState {
  final String stringError;

  DeleteCardError({required this.stringError});
}
