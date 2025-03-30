part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class Authenticate extends LoginEvent{
  String email;
  String password;
  Authenticate({required this.password,required this.email});
}
