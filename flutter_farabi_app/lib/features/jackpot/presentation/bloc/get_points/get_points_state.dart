part of 'get_points_cubit.dart';

@immutable
sealed class GetPointsState {}

final class GetPointsInitial extends GetPointsState {}

final class GetPointsLoading extends GetPointsState {}
final class GetPointsLoaded extends GetPointsState {
  final double points;
  final double maxPoints;

  GetPointsLoaded( {required this.points, required this.maxPoints});
}
final class GetPointsError extends GetPointsState {
  final String errorString;

  GetPointsError({required this.errorString});
}
