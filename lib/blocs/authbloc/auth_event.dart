part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

// ignore: must_be_immutable
class LoginEvent extends AuthEvent {
  String email;
  String password;

  LoginEvent({required this.email, required this.password});
}

class RegisterEvent extends AuthEvent {}
