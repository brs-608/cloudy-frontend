import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:cloudy/Bloc/Auth/Login/login_bloc.dart';
import 'package:cloudy/Cubits/auth_cubit.dart';
import 'package:cloudy/Home/messages.dart';
import 'package:cloudy/Home/profile.dart';
import 'package:cloudy/Utils/TokenUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Bloc/Messages/chat_history_cubit.dart';
import '../Bloc/UserInfo/users_info_bloc.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  int _currentIndex = 0;
  List<Widget> _pages = [
      Messages(),
      Profile(),
      Center(child: Text("Third Page",style: TextStyle(fontSize: 26),),),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: _pages[_currentIndex],
        bottomNavigationBar: AnimatedBottomNavigationBar(
          backgroundGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
              colors: [
            Colors.white60,
            Colors.white70,
            // Colors.blueGrey.withValues(alpha: 0.1),
            Colors.blueGrey.withValues(alpha: 0.6),
          ]),
          leftCornerRadius: 30,
          rightCornerRadius: 30,
          activeColor: Colors.blueGrey,
          inactiveColor: Colors.black.withValues(alpha: 0.6),
          iconSize: 24,
            gapWidth: 1,
            gapLocation: GapLocation.none,
            icons: [
          Icons.chat,
          Icons.person,
          Icons.collections_bookmark,
        ], activeIndex: _currentIndex, onTap: (value){
            setState(() {
              _currentIndex = value;
            });
        }),
        floatingActionButton: _currentIndex==0?FloatingActionButton(onPressed: (){},child: Icon(Icons.add_comment_sharp,color: Colors.white,),backgroundColor: Colors.blueAccent,):null,
      ),
    );
  }
}
