part of 'users_info_bloc.dart';

@immutable
sealed class UsersInfoState {}

final class UsersInfoInitial extends UsersInfoState {}

class FetchedData extends UsersInfoState{
  Map<String,dynamic> data;
  FetchedData({required this.data});
}