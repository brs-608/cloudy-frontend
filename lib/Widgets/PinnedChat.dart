import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class PinnedChat extends StatelessWidget {
  bool isOnline;
  int newMessages;
  String name;
  String lastMessage;
  String profilePci;
  PinnedChat({required this.isOnline,required this.newMessages,required this.name,required this.lastMessage,required this.profilePci});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0,right: 10),
      child: Stack(
        children: [
          Container(
            height: 190,
            width: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blueGrey.withValues(alpha: 0.5),
                image: DecorationImage(image: NetworkImage("https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg"),fit: BoxFit.fitHeight)
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0,top: 5),
            child: newMessages >0?Container(
              margin: EdgeInsets.only(left: 0),
              height: 25,
              width: 25,
              decoration: BoxDecoration(

                  shape: BoxShape.circle,
                  color: Colors.black87
              ),
              child: Center(child: Text(newMessages.toString(),style: TextStyle(color: Colors.white,fontSize: 16),)),
            ):Icon(FontAwesomeIcons.checkDouble,color: Colors.black87,),
          ),
          Padding(
            padding: EdgeInsets.only(left: 80,top: 5),
            child: Container(
              margin: EdgeInsets.only(left: 53),
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.white,
                      width: 1.5
                  ),
                  shape: BoxShape.circle,
                  color: isOnline?Colors.green:Colors.grey
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 120),
            padding: EdgeInsets.only(top: 5),
            height: 70,
            width: 160,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.blueGrey.withValues(alpha: 0.0),
                      Colors.blueGrey.withValues(alpha: 0.7),
                      Colors.blueGrey,

                    ]),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,style: GoogleFonts.poppins(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),),
                  Text(lastMessage,style: GoogleFonts.poppins(color: Colors.white.withValues(alpha: 0.7),fontSize: 12,fontWeight: FontWeight.w600),maxLines: 1,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
