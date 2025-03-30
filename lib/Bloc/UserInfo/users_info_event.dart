part of 'users_info_bloc.dart';

@immutable
sealed class UsersInfoEvent {}

class FetchUserDetails extends UsersInfoEvent{
  String token;
  FetchUserDetails({required this.token});
}