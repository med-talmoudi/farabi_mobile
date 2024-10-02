part of 'get_all_history_cubit.dart';

@immutable
sealed class GetAllHistoryState {}

final class GetAllHistoryInitial extends GetAllHistoryState {}
final class GetAllHistoryLoading extends GetAllHistoryState {}
final class GetAllHistoryLoaded extends GetAllHistoryState {}
final class GetAllHistoryError extends GetAllHistoryState {}

