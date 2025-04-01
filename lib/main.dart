import 'package:cloudy/Authentication/sign_in.dart';
import 'package:cloudy/Bloc/Auth/Login/login_bloc.dart';
import 'package:cloudy/Bloc/Auth/Register/register_bloc.dart';
import 'package:cloudy/Bloc/Messages/chat_history_cubit.dart';
import 'package:cloudy/Bloc/UserInfo/users_info_bloc.dart';
import 'package:cloudy/Cubits/SearchCubits/search_cubit.dart';
import 'package:cloudy/Cubits/auth_cubit.dart';
import 'package:cloudy/Home/home.dart';
import 'package:cloudy/SplashScreen/SplashScreen.dart';
import 'package:cloudy/example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(Cloudy());
}


class Cloudy extends StatelessWidget {
  const Cloudy({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => RegisterBloc()),
          BlocProvider(create: (_) => LoginBloc()),
          BlocProvider(create: (_) => AuthCubit()),
          BlocProvider(create: (_) => UsersInfoBloc()),
          BlocProvider(create: (_) => ChatHistoryCubit()),
          BlocProvider(create: (_) => SearchCubit()),
        ],
      child: MaterialApp(

          home: Splashscreen()
      ),
    );
  }
}
