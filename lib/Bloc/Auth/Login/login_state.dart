part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class AuthenticationStatus extends LoginState{
  String token;

  AuthenticationStatus({required this.token});
}
