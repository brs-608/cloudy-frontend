import 'dart:convert';
import 'dart:ui';
import 'package:cloudy/Bloc/Messages/chat_history_cubit.dart';
import 'package:cloudy/Home/home.dart';
import 'package:cloudy/Home/messages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart'as http;
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_socket_channel/io.dart';

import '../Widgets/Message.dart';


class ChatScreen extends StatefulWidget {
  int userId;
  int receiverId;
  String partnerName;
  ChatScreen({required this.userId,required this.receiverId,required this.partnerName});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late IOWebSocketChannel channel;
  final TextEditingController messageController = TextEditingController();
  List<Map<String,dynamic>> messages = [];
  @override
  void initState() {
    loadChatHistory();
    setupWebSocket();
  }
  Future<void> loadChatHistory()async{
    final response = await http.get(Uri.parse("http://192.168.0.105:8080/chat/history/${widget.userId}/${widget.receiverId}"));
    if(response.statusCode == 200){
      List<dynamic> history = jsonDecode(response.body);
      setState(() {
        messages = history.map((m)=>m as Map<String,dynamic>).toList();
        // print(messages);
        // print(history);
      });
    }else{
      print("${response.statusCode}");
    }
  }
  void setupWebSocket(){
    channel = IOWebSocketChannel.connect("ws://192.168.0.105:8080/chat");
    channel.stream.listen((message){
      final message1 = jsonDecode(message) as Map<String,dynamic>;
      setState(() {
        messages.add(message1);
      });
    },
    onError: (error){
      print("$error");
    }
    );
  }
  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      final payload = {
        "userId": widget.userId,
        "receiverId": widget.receiverId,
        "text": messageController.text
      };
      channel.sink.add(jsonEncode(payload));
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = BlocProvider.of<ChatHistoryCubit>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xe8ffffff),
        body: Stack(
          children: [

            SingleChildScrollView(
              reverse: true,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100,top: 120),
                child: Column(
                  children: messages.map((message){
                    return Message(isRight: message["sender"]["id"] == widget.userId,text: message["text"],dateTime: "time_stamp",);
                  }).toList()
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    height: 80,
                    color: Colors.transparent, // Make the container transparent
                  ),
                ),
              ),
            ),

            // at below container I want it to be blur things behind it
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xa6f6efef)
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20,right: 10),
                  child: Row(
                    children: [
                      IconButton(onPressed: (){
                        provider.getChats();
                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Home()));}, icon: Icon(Icons.arrow_back)),
                      Container(

                        margin: EdgeInsets.only(left:10,top: 2),
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image: NetworkImage("https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",scale: 1,),fit: BoxFit.fitHeight)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${widget.partnerName}",style: GoogleFonts.poppins(fontSize: 17,fontWeight: FontWeight.w600),),
                            Text("Online",style: GoogleFonts.poppins(fontSize: 13,fontWeight: FontWeight.w600,color: Color(
                                0xff00d333)),),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Card(
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Icon(Icons.more_horiz_rounded,size: 30,),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 20,left: 10,right: 10),
                height:60,
                width: double.infinity,
                // color: Colors.black,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    end: Alignment.topLeft,
                      begin: Alignment.bottomRight,
                      colors: [
                        Color(0xfff3f2f2),
                        Color(0xfffff0f0),
                        Color(0xfff4f4f4),
                      ]
                  )
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10,right: 15),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.attach_file,size: 26,),
                      ),
                      Expanded(
                          child: TextFormField(
                            controller: messageController,
                            decoration: InputDecoration(
                              hintText: "Type Message",
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10,right: 10),
                          child: Icon(FontAwesomeIcons.microphone,size: 20,)),
                      InkWell(
                        onTap: (){
                          sendMessage();
                        },
                          child: Icon(Icons.send))
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
