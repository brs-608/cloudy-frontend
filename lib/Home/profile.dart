import "package:cloudy/Widgets/profile_info_holder.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:google_fonts/google_fonts.dart";

import "../Bloc/UserInfo/users_info_bloc.dart";

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersInfoBloc, UsersInfoState>(
  builder: (context, state) {
    if(state is FetchedData){
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15,left: 10),
              child: SizedBox(
                  height: 40,
                  width: 40,
                  child: Card(
                      elevation: 7,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Icon(Icons.settings,size: 22,
                      ))),
            ),
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 55,

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(child: Text("${state.data["first_name"]}" + " " + "${state.data["last_name"]}",style: GoogleFonts.poppins(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w400),)),
            ),
            Center(child: Text("${state.data["email_id"]}",style: GoogleFonts.poppins(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),)),
            // Padding(
            //   padding: const EdgeInsets.only(top: 10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.only(right: 8.0),
            //         child: ElevatedButton(
            //           onPressed: (){},
            //           style: ButtonStyle(
            //             overlayColor: WidgetStateProperty.all<Color>(Colors.black.withValues(alpha: 0.1)),
            //             foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
            //             backgroundColor: WidgetStateProperty.all<Color>(
            //               Colors.white,
            //             ),
            //             shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            //                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(2),side: BorderSide(strokeAlign: 1,color: Colors.black))
            //             ),
            //           ),
            //           child: Text("Follow",style: GoogleFonts.poppins(color: Colors.black,fontSize: 14),),
            //         ),
            //       ),
            //       ElevatedButton(
            //         onPressed: (){},
            //         style: ButtonStyle(
            //           overlayColor: WidgetStateProperty.all<Color>(Colors.black.withValues(alpha: 0.1)),
            //           foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
            //           backgroundColor: WidgetStateProperty.all<Color>(
            //             Colors.white,
            //           ),
            //           shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            //               RoundedRectangleBorder(borderRadius: BorderRadius.circular(2),side: BorderSide(strokeAlign: 1,color: Colors.black))
            //           ),
            //         ),
            //         child: Text("Message",style: GoogleFonts.poppins(color: Colors.black,fontSize: 14),),
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProfileInfoHolder(value: 12,info: "Followers",),
                    ProfileInfoHolder(value: 20,info: "Likes",),
                    ProfileInfoHolder(value: 32,info: "Post",),
                    ProfileInfoHolder(value: 1000,info: "Views",),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10,top: 10),
              child: Row(
                children: [
                  SizedBox(
                    height: 40,
                    width: 90,
                    child: Card(
                        elevation: 1,
                        color: selected == 0?Colors.black:Color(0xe8f8fbfd),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: InkWell(
                            onTap: (){
                              setState(() {
                                selected = 0;
                              });
                            },
                            borderRadius: BorderRadius.circular(20),
                            child: Center(child: Text("Updates",style: GoogleFonts.poppins(color: selected == 0?Colors.white:Colors.black,fontSize: 13,fontWeight: FontWeight.w300),)))),
                  ),
                  SizedBox(
                    height: 40,
                    width: 90,
                    child: Card(
                        elevation: 1,
                        color: selected == 1?Colors.black:Color(0xe8f8fbfd),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: InkWell(
                            onTap: (){
                              setState(() {
                                selected = 1;
                              });
                            },
                            borderRadius: BorderRadius.circular(20),
                            child: Center(child: Text("Posts",style: GoogleFonts.poppins(color: selected == 1?Colors.white:Colors.black,fontSize: 13,fontWeight: FontWeight.w300),)))),
                  ),
                  SizedBox(
                    height: 40,
                    width: 90,
                    child: Card(
                        elevation: 1,
                        color: selected == 2?Colors.black:Color(0xe8f8fbfd),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: InkWell(
                            onTap: (){
                              setState(() {
                                selected = 2;
                              });
                            },
                            borderRadius: BorderRadius.circular(20),
                            child: Center(child: Text("About",style: GoogleFonts.poppins(color: selected == 2?Colors.white:Colors.black,fontWeight: FontWeight.w300),)))),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
    return Container(
      child: Center(child: Text("Something went wrong",style: GoogleFonts.poppins(color: Colors.black,fontSize: 22),)),
    );
  },
);
  }
}
