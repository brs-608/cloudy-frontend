import 'package:cloudy/Authentication/register.dart';
import 'package:cloudy/Bloc/Auth/Login/login_bloc.dart';
import 'package:cloudy/Bloc/Messages/chat_history_cubit.dart';
import 'package:cloudy/Bloc/UserInfo/users_info_bloc.dart';
import 'package:cloudy/Utils/TokenUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../Home/home.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isPasswordVisible = false;
  TextEditingController email_id = TextEditingController();
  TextEditingController password = TextEditingController();
  TokenUtil tokenUtil = TokenUtil();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // tokenUtil.init();
  }
  @override
  Widget build(BuildContext context) {
    final provider = BlocProvider.of<LoginBloc>(context);
    final provider2 = BlocProvider.of<UsersInfoBloc>(context);
    final provider3 = BlocProvider.of<ChatHistoryCubit>(context);
    return Scaffold(
      backgroundColor: Color(0xe87bd6ff),
      resizeToAvoidBottomInset: false,
      body: BlocListener<LoginBloc,LoginState>(
        listener: (context,state){
          if(state is AuthenticationStatus){
              if(state.token != ""){
                provider2.add(FetchUserDetails(token: state.token));
                provider3.getChats();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
              }
          }
        },
        child:  Container(
          height: double.infinity,
          // alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/transcloud.png"),fit: BoxFit.fill,alignment: Alignment.bottomCenter)
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30,right: 30,top: MediaQuery.of(context).size.height <= 640?80:160,bottom: 80),
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
                      height: 500,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              child: SizedBox(
                                height: 55,
                                width: 55,
                                child: Center(child: Icon(FontAwesomeIcons.rightToBracket,color: Colors.black,size: 22,)),
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text("Sign in with email",style: GoogleFonts.nunito(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 24),)),
                          Padding(
                              padding: EdgeInsets.only(top: 3),
                              child: Center(child: Text("Communicate with your special ones via voice calls , SMS and video calls. For Free.",style: GoogleFonts.openSans(color: Colors.black.withValues(alpha: 0.5),fontWeight: FontWeight.w600,fontSize: 14),textAlign: TextAlign.center,))),
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
                                            hintText: "Password",
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
                            padding: EdgeInsets.only(right: 25),
                            alignment: Alignment.centerRight,
                            width: double.infinity,
                            child: Text("Forgot Password?",style: GoogleFonts.poppins(color: Colors.blueGrey,fontSize: 14,fontWeight: FontWeight.w500),),
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
                                      print("clicked");
                                      if(email_id.text.toString() != "" && password.text.toString() != ""){
                                        provider.add(Authenticate(password: password.text.toString(), email: email_id.text.toString()));
                                      }else{
                                        debugPrint("something is missing");
                                      }
                                    },
                                    child: Text("Sign In",style: GoogleFonts.poppins(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w700),)),
                              )),
                          Container(
                            padding: EdgeInsets.only(left: 25),
                            alignment: Alignment.centerLeft,
                            width: double.infinity,
                            child: Row(
                              children: [
                                Text("Don't have an account?",style: GoogleFonts.poppins(color: Colors.blueGrey,fontSize: 12,fontWeight: FontWeight.w500),),
                                SizedBox(width: 5,),
                                InkWell(
                                    onTap: (){
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> RegisterScreen()));
                                    },
                                    child: Text("Register!",style: GoogleFonts.poppins(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600),)),

                              ],
                            ),
                          ),
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
        ),
      )

    );
  }
}
