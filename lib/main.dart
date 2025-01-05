import 'package:cloudy/Authentication/sign_in.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(Cloudy());
}


class Cloudy extends StatelessWidget {
  const Cloudy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SignIn(),
    );
  }
}
