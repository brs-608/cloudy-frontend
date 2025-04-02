import 'dart:async';

import 'package:cloudy/Authentication/sign_in.dart';
import 'package:cloudy/Bloc/Messages/chat_history_cubit.dart';
import 'package:cloudy/Bloc/UserInfo/users_info_bloc.dart';
import 'package:cloudy/Chat/chat_screen.dart';
import 'package:cloudy/Cubits/SearchCubits/search_cubit.dart';
import 'package:cloudy/Home/OtherProfile.dart';
import 'package:cloudy/Utils/TokenUtil.dart';
import 'package:cloudy/Widgets/ChatsWidget.dart';
import 'package:cloudy/Widgets/OnlineWidget.dart';
import 'package:cloudy/Widgets/PinnedChat.dart';
import 'package:cloudy/Widgets/SearchedUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  FocusNode focusNode = FocusNode();
  bool isFocused = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener((){
      setState(() {
        isFocused = focusNode.hasFocus;
      });
    });
  }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    focusNode.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final provider = BlocProvider.of<ChatHistoryCubit>(context);
    final provider2 = BlocProvider.of<SearchCubit>(context);
    return BlocListener<SearchCubit, SearchState>(
  listener: (context, state) {
    if(state is SearchLoading){
      print("loading");
    }else if (state is SearchLoaded){
      print("this is search users : ${state.users}");
    }
  },
  child: ListView(
      children: [
          Padding(
            padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Messages",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w700),),
                InkWell(
                  onTap: (){
                    Timer(Duration(seconds: 5), (){
                      TokenUtil.removeToken();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignIn()));
                    });
                  },
                  child: Container(
                    height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child: Icon(Icons.settings_sharp,size: 18,)),
                )
              ],
            ),

          ),
        Padding(
          padding: EdgeInsets.only(left: 10,right: 10,top: 30),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                  Onlinewidget(profilePic: "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg", name: "Ahmed"),
                  Onlinewidget(profilePic: "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg", name: "Ahmed"),
                  Onlinewidget(profilePic: "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg", name: "Ahmed"),
                  Onlinewidget(profilePic: "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg", name: "Ahmed"),
                  Onlinewidget(profilePic: "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg", name: "Ahmed"),
                  Onlinewidget(profilePic: "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg", name: "Ahmed"),
                  Onlinewidget(profilePic: "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg", name: "Ahmed"),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15,right: 15,top: 35),
          child: Container(
            padding: EdgeInsets.only(left: 15,right: 15),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                  colors: [
                Colors.grey.withValues(alpha: 0.2),
                Colors.blueGrey.withValues(alpha: 0.1),
                Colors.blueGrey.withValues(alpha: 0.3),
              ]
              )
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(

                    decoration: InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                    onChanged: (query){
                      provider2.searchHistory(query);
                    },
                    focusNode: focusNode,
                  ),
                ),
                Icon(Icons.search,color: Colors.blueGrey,)
              ],
            ),
          ),
        ),
        Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30,left: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.push_pin_sharp,color: Colors.blueGrey,size: 28,),
                      Text("Pinned Chats",style: GoogleFonts.poppins(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 20,left: 10,right: 0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PinnedChat(isOnline: true, newMessages: 3, name: "Ali Khan", lastMessage: "kidhar ho bhai?", profilePci: "https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg"),
                        // SizedBox(width: 10,),
                        PinnedChat(isOnline: false, newMessages: 0, name: "Ali Khan", lastMessage: "kidhar ho bhai?", profilePci: "https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg"),
                        PinnedChat(isOnline: true, newMessages: 1, name: "Ali Khan", lastMessage: "kidhar ho bhai?", profilePci: "https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg"),
                        PinnedChat(isOnline: true, newMessages: 3, name: "Ali Khan", lastMessage: "kidhar ho bhai?", profilePci: "https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg"),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30,left: 25),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.chat_bubble_rounded,color: Colors.black,size: 28,),
                      SizedBox(width: 5,),
                      Text("All Chats",style: GoogleFonts.poppins(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
                BlocBuilder<ChatHistoryCubit,ChatHistoryState>(
                    builder: (context,state){
                      if(state is UserChatHistory){
                        List messages = state.messages;
                        print("ye dikho bhai !! : ${messages}");
                        return Column(
                          children: messages.map((message){
                            return ChatsWidget(profilePic: "", lastMessage: message["lastMessage"]["text"], name: message["partner"]["first_name"] + " " +message["partner"]["last_name"], isRecording: false, isTyping: false, time: message["lastMessage"]["time_stamp"], newMessages: 1, isOnline: true,userId: message["user"]["id"],receiverId: message["partner"]["id"],);
                          }).toList()
                        );
                      }else{
                        return Center(child: Text("No Chats",style: GoogleFonts.poppins(fontWeight: FontWeight.w800,fontSize: 24,color: Colors.black),));
                      }
                    }
                ),
              ],
            ),
            isFocused ?Container(
                              margin: EdgeInsets.only(left: 15,right: 15,top: 5),
                              // height: 60,
                              // color: Colors.blue,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    end: Alignment.topLeft,
                                    begin: Alignment.bottomRight,
                                      colors: [
                                        Color(0xffdadada),
                                        Color(0xffe1e1e1),
                                        Color(0xffdfe4ec),
                                      ]
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: BlocBuilder<SearchCubit,SearchState>(
                                  builder: (context,state){
                                    if(state is SearchInitial){
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 60),
                                        child: Center(child: Text("Search Users",style: GoogleFonts.poppins(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w400),)),
                                      );
                                    }else if (state is SearchLoading){
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 60),
                                        child: Center(child: Text("Loading",style: GoogleFonts.poppins(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w400),)),
                                      );
                                    }else if (state is SearchLoaded){
                                      return SingleChildScrollView(
                                        child: Column(
                                          children: state.users.map((user){
                                            return BlocBuilder<UsersInfoBloc,UsersInfoState>(
                                                builder: (context,state){
                                                  if(state is FetchedData){
                                                    return GestureDetector(
                                                    behavior: HitTestBehavior.opaque,
                                                    onTapDown: (_) {
                                          FocusScope.of(context).requestFocus(focusNode);
                                            print("Tapped ${user['name']}");},
                                            onTap: (){
                                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OtherProfile(name: user["name"], email: user["email"], userId: user["id"])));
                                              focusNode.requestFocus();
                                            },
                                            child: SearchedUser(name: user["name"],email: user["email"],profilePic: "",id: user["id"],));
                                                  }
                                                  return Container();
                                                }
                                            );
                                          }).toList(),
                                        ),
                                      );
                                    }
                                    return Container();
                                  }
                              )
                            ):Container()
          ],
        ),

        // ChatsWidget(profilePic: "https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg",lastMessage: "kahan ho bhai?",name: "Burhan Shaikh",isRecording: true,isTyping: false,time: "12:23",newMessages: 0,isOnline: true,),
      ],
    ),
);
  }
}
