part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

class LoadingLoginState extends GlobalState {}

class SuccessfulLoginState extends GlobalState {
  final LoginModel loginModel;

  SuccessfulLoginState(this.loginModel);
}

class ErrorLoginState extends GlobalState {
  final LoginModel loginModel;

  ErrorLoginState(this.loginModel);
}

class LoadingTableState extends GlobalState {}

class SuccessfulTableState extends GlobalState {}

class ErrorTableState extends GlobalState {}
