import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileInfoHolder extends StatelessWidget {
  // const ProfileInfoHolder({super.key});
  String info;
  int value;
  ProfileInfoHolder({required this.info,required this.value});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3.0,right: 3),
      child: SizedBox(
        width: 110,
        height: 90,
        child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            elevation: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$value",style: GoogleFonts.poppins(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
                Text("$info",style: GoogleFonts.poppins(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w300),),
              ],
            )
        ),
      ),
    );
  }
}
