import 'package:cloudy/Chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class ChatsWidget extends StatelessWidget {
  String profilePic;
  String name;
  bool isTyping;
  String lastMessage;
  String time;
  bool isRecording;
  int newMessages;
  bool isOnline;
  int userId;
  int receiverId;
  ChatsWidget({required this.profilePic,required this.lastMessage,required this.name,required this.isRecording,required this.isTyping,required this.time,required this.newMessages,required this.isOnline,required this.userId,required this.receiverId});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChatScreen(userId: userId,receiverId: receiverId,partnerName: name,)));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20,top: 10,bottom: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 2),
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(image: NetworkImage(profilePic,scale: 1,),fit: BoxFit.fitHeight)
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 43,top: 0,bottom: 2),
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isOnline?Colors.green:Colors.grey
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 0,right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("$name",style: GoogleFonts.poppins(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
                            Text(time,style: GoogleFonts.poppins(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              isRecording?Icon(Icons.mic):SizedBox(width: 10,),
                              Text(isRecording?"recording a voice message":isTyping?"$name is typing ....":lastMessage,style: GoogleFonts.poppins(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500),maxLines: 1,),
                            ],
                          ),
                          newMessages>0?Container(
                            margin: EdgeInsets.only(left: 0),
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(

                                shape: BoxShape.circle,
                                color: Colors.black87
                            ),
                            child: Center(child: Text(newMessages.toString(),style: TextStyle(color: Colors.white,fontSize: 14),)),
                          ):Icon(FontAwesomeIcons.checkDouble,color: Colors.black,size: 16,)
                        ],
                      )
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
