import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<RegisterUser>((event,emi)async{
      Map<String,dynamic> data = {
        "emailId" : event.email_id,
        "first_name" : event.first_name,
        "last_name" : event.last_name,
        "date_of_birth" : event.date_of_birth.toIso8601String(),
        "password" : event.password,
        "role" : event.role,
        "gender" : event.gender,
        "phone_number" : event.phone_number
      };
      final url = Uri.parse("http://192.168.0.105:8080/auth/create-user");
      Future<String>  createUser()async{
        final response = await http.post(
            url,
          headers: {
              "Content-Type" :"application/json"
          },
          body: jsonEncode(data)
        );
        try{
          if(response.statusCode == 200){
            print("behtreen ho gya januu!");
            return "User is created!";

          }else{
            print("kouch ghand si margai");
            return "Something happened";
          }
        }catch (e) {
          print("lore lag gaye");
          return "Something went wrong";
        }

      }
      String message = await createUser();
      emit(RegisteredStatus(message: message));
    });
  }
}
