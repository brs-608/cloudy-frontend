import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchedUser extends StatelessWidget {
  
  String name;
  String email;
  int id;
  String profilePic;


  SearchedUser({required this.name, required this.email, required this.id, required this.profilePic});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20,top: 10,bottom: 10),
      width: double.infinity,
      height: 60,
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.blue,
            child: Image.network("$profilePic"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$name",style: GoogleFonts.poppins(fontSize: 16),),
                Text("$email",style: GoogleFonts.poppins(fontSize: 16),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
