import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cloudy/Utils/TokenUtil.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> checkAuthStatus()async{
    String? token = await TokenUtil.getToken();
    print("$token under checkAuthStatus");
    if(token != null && token.isNotEmpty){
      if(_isTokenExpired(token)){
        await TokenUtil.removeToken();
        // print(token);
        emit(AuthInitial());
        return;
      }
      emit(Authenticated(token: token));
    }else{
      emit(AuthInitial());
    }

  }

  bool _isTokenExpired(String token){
    try{
      final parts = token.split(".");
      if(parts.length != 3){
        return true;
      }
      final payload = json.decode(
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1])))
      );
      final exp = payload["exp"];
      if(exp == null || exp is! int) {return true;}
      final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      return exp<now;
    }catch(e){
      return true;
    }
  }
}
