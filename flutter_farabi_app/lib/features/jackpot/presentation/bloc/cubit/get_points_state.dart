part of 'get_points_cubit.dart';

@immutable
sealed class GetPointsState {}

final class GetPointsInitial extends GetPointsState {}

final class GetPointsLoading extends GetPointsState {}
final class GetPointsLoaded extends GetPointsState {
  final double points;

  GetPointsLoaded({required this.points});
}
final class GetPointsError extends GetPointsState {
  final String errorString;

  GetPointsError({required this.errorString});
}
