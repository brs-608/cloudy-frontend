import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'users_info_event.dart';
part 'users_info_state.dart';

class UsersInfoBloc extends Bloc<UsersInfoEvent, UsersInfoState> {
  UsersInfoBloc() : super(UsersInfoInitial()) {
    on<UsersInfoEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<FetchUserDetails>((event,emit)async{
        String token = event.token;
        final emailLink = Uri.parse("http://192.168.0.105:8080/users/email");
        try{
          final response = await http.get(
              emailLink,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            }
          );
          if(response.statusCode == 200){
            final email = response.body;
            // print("${response.body} yahan se aarhai hai email");
            final userLink = Uri.parse("http://192.168.0.105:8080/users/get-user/$email");
            final fetchedData = await http.get(
              userLink,
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $token',
              }
            );
            if(fetchedData.statusCode == 200){
              Map<String,dynamic> userData = jsonDecode(fetchedData.body);
              emit(FetchedData(data: userData));
            }else{
              print("kouch masla hai");
            }
          }else{
            print("pata nahi kia howa");
          }
        }catch(e){
          print("${e.toString()} ye howa bhai");
          print("dikhte hain kouch");
        }
    });
  }
}
