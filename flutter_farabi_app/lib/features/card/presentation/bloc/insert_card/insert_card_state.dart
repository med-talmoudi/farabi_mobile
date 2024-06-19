part of 'insert_card_cubit.dart';

@immutable
sealed class InsertCardState {}

final class InsertCardInitial extends InsertCardState {}

final class InsertCardLoading extends InsertCardState {}

final class InsertCardLoaded extends InsertCardState {}

final class InsertCardError extends InsertCardState {
  final String stringError;

  InsertCardError({required this.stringError});
}
