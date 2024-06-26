part of 'card_details_cubit.dart';

@immutable
sealed class CardDetailsState {}

final class CardDetailsInitial extends CardDetailsState {}
final class CardDetailsLoading extends CardDetailsState {}
final class CardDetailsLoaded extends CardDetailsState {
  final String fullName;
  final String cardNumber;
  final String id;

  CardDetailsLoaded({required this.fullName, required this.cardNumber, required this.id });
}
final class CardDetailsError extends CardDetailsState {
  final String errorString;

  CardDetailsError({required this.errorString});
}
