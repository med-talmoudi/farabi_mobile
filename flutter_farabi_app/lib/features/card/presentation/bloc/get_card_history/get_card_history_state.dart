part of 'get_card_history_cubit.dart';

@immutable
sealed class GetCardHistoryState {}

final class GetCardHistoryInitial extends GetCardHistoryState {}
final class GetCardHistoryLoading extends GetCardHistoryState {}
final class GetCardHistoryLoaded extends GetCardHistoryState {
   final Map<String, dynamic> data;

  GetCardHistoryLoaded (this.data);
}
final class GetCardHistoryError extends GetCardHistoryState {
   final String errorString;

  GetCardHistoryError({required this.errorString});
}
