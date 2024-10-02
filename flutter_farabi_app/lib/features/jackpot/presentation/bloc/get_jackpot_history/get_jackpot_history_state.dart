part of 'get_jackpot_history_cubit.dart';

@immutable
sealed class GetJackpotHistoryState {}

final class GetJackpotHistoryInitial extends GetJackpotHistoryState {}
final class GetJackpotHistoryLoading extends GetJackpotHistoryState {}
final class GetJackpotHistoryLoaded extends GetJackpotHistoryState {
  final Map<String, dynamic> data;

  GetJackpotHistoryLoaded  (this.data);
}
final class GetJackpotHistoryError extends GetJackpotHistoryState {
  final String errorString;

  GetJackpotHistoryError({required this.errorString});
}
