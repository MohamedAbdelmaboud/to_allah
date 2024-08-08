part of 'login_cubit.dart';

abstract class LoginCubitState {}

class LoginInitialState extends LoginCubitState {}

class LoginLoadingState extends LoginCubitState {}

class LoginErrorState extends LoginCubitState {
  final String message;

  LoginErrorState(this.message);
}

class LoginSuccessState extends LoginCubitState {}
