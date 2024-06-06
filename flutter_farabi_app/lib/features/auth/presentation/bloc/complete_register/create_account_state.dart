part of 'create_account_cubit.dart';

@immutable
sealed class CreateAccountState {}

final class CreateAccountInitial extends CreateAccountState {

}
final class CreateAccountLoading extends CreateAccountState {
  
}
final class CreateAccountLoaded extends CreateAccountState {
  
}
final class CreateAccountError extends CreateAccountState {
  final String stringError  ;

  CreateAccountError({required this.stringError});
}

