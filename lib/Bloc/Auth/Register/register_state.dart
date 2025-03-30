part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}


class RegisteredStatus extends RegisterState{
  String message;
  RegisteredStatus({required this.message});
}