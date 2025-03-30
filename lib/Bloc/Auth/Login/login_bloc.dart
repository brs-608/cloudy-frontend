import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:cloudy/Utils/TokenUtil.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<Authenticate>((event, emit) async {
      final link = Uri.parse("http://192.168.0.105:8080/auth/login");
      Map<String, String> credentials = {
        "email": event.email,
        "password": event.password
      };

      try {
        final response = await http.post(
          link,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(credentials),
        );

        if (response.statusCode == 200) {
          Map<String, dynamic> data = jsonDecode(response.body);
          String? token = data["token"];
          if(token!= null && token.isNotEmpty){
            await TokenUtil.saveToken(token);
            String? savedToken = await TokenUtil.getToken();
            print(savedToken);
          }
          emit(AuthenticationStatus(token: token ?? ""));
          print(token);
        } else {
          emit(AuthenticationStatus(token: ""));
        }
      } catch (e) {
        emit(AuthenticationStatus(token: ""));
      }
    });
  }
}
