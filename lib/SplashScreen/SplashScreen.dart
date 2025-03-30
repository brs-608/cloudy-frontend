import 'dart:async';

import 'package:cloudy/Authentication/sign_in.dart';
import 'package:cloudy/Bloc/UserInfo/users_info_bloc.dart';
import 'package:cloudy/Cubits/auth_cubit.dart';
import 'package:cloudy/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Bloc/Messages/chat_history_cubit.dart';

class Splashscreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final provider1 = BlocProvider.of<ChatHistoryCubit>(context);
    final provider = BlocProvider.of<AuthCubit>(context);
    final userInfoProvider = BlocProvider.of<UsersInfoBloc>(context);
    provider.checkAuthStatus();
    return BlocListener<AuthCubit, AuthState>(
  listener: (context, state) {
    if(state is Authenticated){
      debugPrint("${state.token} under bloc listener");
      userInfoProvider.add(FetchUserDetails(token: state.token));
      Timer(Duration(seconds: 10),(){
        provider1.getChats();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
      });
    }else if (state is AuthInitial){
      Timer(Duration(seconds: 10),(){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn()));
      });
    }
  },
  child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text("Cloudy",style: GoogleFonts.bangers(color: Colors.blue,fontSize: 64,fontWeight: FontWeight.w900),),),
              // Center(child: Container(height:20,width:20,child: CircularProgressIndicator(color: Colors.blue,)),)
            ],
          )),
          Expanded(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(child: Text("by",style: GoogleFonts.dmSerifText(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w500),),),
                  Center(child: Text("Burmic",style: GoogleFonts.bangers(color: Colors.blue,fontSize: 32,fontWeight: FontWeight.w500),),),
                ],
              ),
            ),
          )
        ],
      ),
    ),
);
  }
}
