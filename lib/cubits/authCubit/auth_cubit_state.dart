part of 'auth_cubit_cubit.dart';

@immutable
sealed class AuthCubitState {}

final class AuthCubitInitial extends AuthCubitState {}

final class LoginLoading extends AuthCubitState {}

final class LoginSuccess extends AuthCubitState {}

// ignore: must_be_immutable
final class LoginFailure extends AuthCubitState {
  String errMessage;

  LoginFailure({required this.errMessage});
}

final class RegisterLoading extends AuthCubitState {}

final class RegisterSuccess extends AuthCubitState {}

// ignore: must_be_immutable
final class RegisterFailure extends AuthCubitState {
  String errMessage;

  RegisterFailure({required this.errMessage});
}
