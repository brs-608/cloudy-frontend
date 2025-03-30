part of 'chat_history_cubit.dart';

@immutable
sealed class ChatHistoryState {}

final class ChatHistoryInitial extends ChatHistoryState {}

class UserChatHistory extends ChatHistoryState{
  List<dynamic> messages;
  String email;
  UserChatHistory({required this.messages,required this.email});
}
