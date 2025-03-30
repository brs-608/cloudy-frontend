import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cloudy/Utils/TokenUtil.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
part 'chat_history_state.dart';

class ChatHistoryCubit extends Cubit<ChatHistoryState> {
  ChatHistoryCubit() : super(ChatHistoryInitial());

  void getChats()async{
    String? token = await TokenUtil.getToken();
    try{final response = await http.get(
        Uri.parse("http://192.168.0.105:8080/users/email"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }
    );
    if(response.statusCode == 200) {
      final email = response.body;
      print("$email yeh wali email");
      try{
        final messages = await http.get(Uri.parse("http://192.168.0.105:8080/chat/history/${email.toString()}"));
        if(messages.statusCode == 200) {
          print("yahan tak pohanch gaye!");
          print(messages.body);
          List history = jsonDecode(messages.body) ;
          emit(UserChatHistory(messages: history,email: email.toString()));
          print("sab thik bhai!!");
        }
      }catch(e){
        print("yahan kouch howa hai !!!! e.toString()");
      }
    }
  }catch(e){
      print("bhai masla yahan pesh aaya : $e");
    }
  }
}
