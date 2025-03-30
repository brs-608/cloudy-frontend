import 'dart:async';

import 'package:cloudy/Authentication/sign_in.dart';
import 'package:cloudy/Bloc/Auth/Register/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isPasswordVisible = false;
  DateTime? date_of_birth;
  String? formattedDate;
  TextEditingController email_id = TextEditingController();
  TextEditingController first_name = TextEditingController();
  TextEditingController last_name = TextEditingController();
  TextEditingController phone_number = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = BlocProvider.of<RegisterBloc>(context);
    return BlocListener<RegisterBloc, RegisterState>(
  listener: (context, state) {
    if(state is RegisteredStatus){
      Timer(Duration(seconds: 3),(){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignIn()));
      });
    }
  },
  child: Scaffold(
        backgroundColor: Color(0xe87bd6ff),
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity,
          // alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/transcloud.png"),fit: BoxFit.fill,alignment: Alignment.bottomCenter)
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30,right: 30,top: MediaQuery.of(context).size.height <= 640?50:90,bottom: 80),
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/pattern.png",),alignment: Alignment.topCenter,scale: 5,opacity: 0.1,fit: BoxFit.fitWidth),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xe871dff3).withValues(alpha: 1),
                              // Color(0xe8bce2f6),
                              // Colors.white,
                              Colors.white,
                              Colors.white,
                              Colors.white,
                              Colors.white
                            ]),
                        borderRadius: BorderRadius.circular(30),
                        border: Border(
                          top: BorderSide(color: Colors.black.withValues(alpha: 0.4),width: 1,),
                          left: BorderSide(color: Colors.black.withValues(alpha: 0.4),width: 1),
                          right: BorderSide(color: Colors.black.withValues(alpha: 0.4),width: 1),
                          bottom: BorderSide(color: Colors.black.withValues(alpha: 0.4),width:1),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withValues(alpha: 0.5),
                              offset: Offset(1, 6),
                              blurRadius: 8,
                              blurStyle: BlurStyle.normal
                          )
                        ]
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 620,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              child: SizedBox(
                                height: 55,
                                width: 55,
                                child: Center(child: Icon(Icons.person,color: Colors.black,size: 32,)),
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text("Register with email",style: GoogleFonts.nunito(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 24),)),
                          Padding(
                              padding: EdgeInsets.only(top: 3),
                              child: Center(child: Text("Communicate with your special ones via voice calls , SMS and video calls. For Free.",style: GoogleFonts.openSans(color: Colors.black.withValues(alpha: 0.5),fontWeight: FontWeight.w600,fontSize: 14),textAlign: TextAlign.center,))),
                          Padding(
                            padding:  EdgeInsets.only(bottom: 5,top: 15),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20,right: 10,),
                                    child: Container(
                                      height: 40,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                          Colors.blueGrey.withValues(alpha: 0.1),
                                          Colors.blueGrey.withValues(alpha: 0.1),
                                          Colors.blueGrey.withValues(alpha: 0.2),
                                        ]),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10,right: 3),
                                            child: Icon(Icons.person,size: 20,color: Colors.blueGrey.withValues(alpha: 0.4),),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(bottom: 6.0),
                                              child: TextFormField(
                                                controller: first_name,
                                                cursorColor: Color(0xe871dff3),
                                                obscureText: false,
                                                keyboardType: TextInputType.emailAddress,
                                                decoration: InputDecoration(
                                                    disabledBorder: InputBorder.none,
                                                    enabledBorder: InputBorder.none,
                                                    focusedErrorBorder: InputBorder.none,
                                                    focusedBorder: InputBorder.none,
                                                    errorBorder: InputBorder.none,
                                                    border: InputBorder.none,
                                                    hintText: "First Name",
                                                    hintStyle: GoogleFonts.poppins(color: Colors.blueGrey.withValues(alpha: 0.7,),fontSize: 15)
                                                ),
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10,right: 20),
                                    child: Container(
                                      height: 40,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                          Colors.blueGrey.withValues(alpha: 0.1),
                                          Colors.blueGrey.withValues(alpha: 0.1),
                                          Colors.blueGrey.withValues(alpha: 0.2),
                                        ]),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10,right: 3),
                                            child: Icon(Icons.person,size: 20,color: Colors.blueGrey.withValues(alpha: 0.4),),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(bottom: 6.0),
                                              child: TextFormField(
                                                controller: last_name,
                                                cursorColor: Color(0xe871dff3),
                                                obscureText: false,
                                                keyboardType: TextInputType.emailAddress,
                                                decoration: InputDecoration(
                                                    disabledBorder: InputBorder.none,
                                                    enabledBorder: InputBorder.none,
                                                    focusedErrorBorder: InputBorder.none,
                                                    focusedBorder: InputBorder.none,
                                                    errorBorder: InputBorder.none,
                                                    border: InputBorder.none,
                                                    hintText: "Last Name",
                                                    hintStyle: GoogleFonts.poppins(color: Colors.blueGrey.withValues(alpha: 0.7,),fontSize: 15)
                                                ),
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20,top: 5),
                            child: Container(
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Colors.blueGrey.withValues(alpha: 0.1),
                                  Colors.blueGrey.withValues(alpha: 0.1),
                                  Colors.blueGrey.withValues(alpha: 0.2),
                                ]),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15,right: 10),
                                    child: Icon(Icons.email,size: 20,color: Colors.blueGrey.withValues(alpha: 0.4),),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 6.0),
                                      child: TextFormField(
                                        controller: email_id,
                                        cursorColor: Color(0xe871dff3),
                                        obscureText: false,
                                        keyboardType: TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                            disabledBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            focusedErrorBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            border: InputBorder.none,
                                            hintText: "Email",
                                            hintStyle: GoogleFonts.poppins(color: Colors.blueGrey.withValues(alpha: 0.7,),fontSize: 15)
                                        ),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                            child: Container(
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Colors.blueGrey.withValues(alpha: 0.1),
                                  Colors.blueGrey.withValues(alpha: 0.1),
                                  Colors.blueGrey.withValues(alpha: 0.2),
                                ]),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15,right: 10),
                                    child: Icon(Icons.phone,size: 20,color: Colors.blueGrey.withValues(alpha: 0.4),),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 6.0),
                                      child: TextFormField(
                                        controller: phone_number,
                                        cursorColor: Color(0xe871dff3),
                                        obscureText: false,
                                        keyboardType: TextInputType.phone,
                                        decoration: InputDecoration(
                                            disabledBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            focusedErrorBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            border: InputBorder.none,
                                            hintText: "Phone Number",
                                            hintStyle: GoogleFonts.poppins(color: Colors.blueGrey.withValues(alpha: 0.7,),fontSize: 15)
                                        ),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                            child: InkWell(
                              onTap: (){
                                showDatePicker(
                                    context: context,
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2010)
                                ).then((value){
                                  if(value != null){
                                      setState(() {
                                        date_of_birth = value;
                                        formattedDate = DateFormat("d MMMM y").format(date_of_birth!);
                                      });
                                  }else{
                                  }
                                });
                              },
                              child: Container(
                                height: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Colors.blueGrey.withValues(alpha: 0.1),
                                    Colors.blueGrey.withValues(alpha: 0.1),
                                    Colors.blueGrey.withValues(alpha: 0.2),
                                  ]),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Row(
                                    children: [
                                      Icon(Icons.calendar_month_outlined,color: Colors.blueGrey.withValues(alpha: 0.4),),
                                      SizedBox(width: 10,),
                                      Text(date_of_birth == null?"Select Your Date Of Birth":formattedDate.toString(),style: GoogleFonts.poppins(color: Colors.blueGrey.withValues(alpha: 0.6),fontWeight: FontWeight.w500),)
                                    ],
                                  ),
                                )
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            child: Container(
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Colors.blueGrey.withValues(alpha: 0.1),
                                  Colors.blueGrey.withValues(alpha: 0.1),
                                  Colors.blueGrey.withValues(alpha: 0.2),
                                ]),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15,right: 10),
                                    child: Icon(Icons.lock,size: 20,color: Colors.blueGrey.withValues(alpha: 0.4),),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 6.0),
                                      child: TextFormField(
                                        controller: password,
                                        cursorColor: Color(0xe871dff3),
                                        obscureText: !isPasswordVisible,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                            disabledBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            focusedErrorBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            border: InputBorder.none,
                                            hintText: "Create Password",
                                            hintStyle: GoogleFonts.poppins(color: Colors.blueGrey.withValues(alpha: 0.7,),fontSize: 15)
                                        ),
                                      ),
                                    ),
                                  ),
                                  isPasswordVisible?GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        isPasswordVisible = !isPasswordVisible;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15,right: 10),
                                      child: Icon(Icons.visibility_off,size: 20,color: Colors.blueGrey.withValues(alpha: 0.4),),
                                    ),
                                  ):GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        isPasswordVisible = !isPasswordVisible;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15,right: 10),
                                      child: Icon(Icons.visibility,size: 20,color: Colors.blueGrey.withValues(alpha: 0.4),),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 25),
                            alignment: Alignment.centerLeft,
                            width: double.infinity,
                            child: Row(
                              children: [
                                Text("Already have an account?",style: GoogleFonts.poppins(color: Colors.blueGrey,fontSize: 12,fontWeight: FontWeight.w500),),
                                SizedBox(width: 5,),
                                InkWell(
                                  onTap: (){
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn()));
                                  },
                                    child: Text("Sign In",style: GoogleFonts.poppins(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600),)),
                              ],
                            ),
                          ),
                          SizedBox(width:double.infinity,
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                              child: ElevatedButton(
                                                  style: ButtonStyle(
                                                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                                      ),
                                                      backgroundColor: WidgetStateProperty.all<Color>(
                                                          Colors.black
                                                      )
                                                  ),
                                                  onPressed: (){
                                                    if(email_id.text.toString() == "" || password.text.toString() == "" || date_of_birth == null || first_name.text.toString() == "" || last_name.text.toString() == "" || phone_number.text.toString() == ""){
                                                      debugPrint("something is missing");
                                                    }else{
                                                      provider.add(RegisterUser(email_id: email_id.text.toString(), first_name: first_name.text.toString(), last_name: last_name.text.toString(), gender: "Male", date_of_birth: date_of_birth!, password: password.text.toString(), phone_number: phone_number.text.toString(), role: "ROLE_User"));
                                                    }

                                                  },
                                                  child: Text("Get Started",style: GoogleFonts.poppins(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w700),)),
                                            )),
                          SizedBox(width: double.infinity,child: Center(child: Padding(
                            padding: const EdgeInsets.only(top: 5,bottom: 5),
                            child: Text("Or sign in with",style: GoogleFonts.poppins(color: Colors.blueGrey,fontSize: 12,fontWeight: FontWeight.w500),),
                          ))),
                          SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal:20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Card(
                                      color: Colors.white,
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                      child: SizedBox(
                                        height: 55,
                                        width: 55,
                                        child: Center(child: Image.asset("assets/google.png",scale: 55,)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Expanded(
                                    child: Card(
                                      color: Colors.white,
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                      child: SizedBox(
                                        height: 55,
                                        width: 55,
                                        child: Center(child: Image.asset("assets/facebook.png",scale: 170,)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Expanded(
                                    child: Card(
                                      color: Colors.white,
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                      child: SizedBox(
                                        height: 55,
                                        width: 55,
                                        child: Center(child: Image.asset("assets/outlook.png",scale: 55,)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    ),
);
  }
}
