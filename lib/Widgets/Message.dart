import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class Message extends StatelessWidget {
  bool isRight;
  String text;
  String dateTime;
  Message({required this.isRight,required this.text,required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isRight?Alignment.centerRight:Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(right: 10,left: 10,bottom: 5,top: 5),
        margin: EdgeInsets.only(left: 10,right: 10,top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(isRight?1:10),topLeft: Radius.circular(isRight?10:1),bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
              colors: [
                Color(0xe88ce5f4).withValues(alpha: 1),
                Color(0xe88ce5f4).withValues(alpha: 1),
                Color(0xe86adbf4).withValues(alpha: 1),
              ]
          )
        ),

        // color: Colors.blue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(text,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500),),
            IntrinsicWidth(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(FontAwesomeIcons.checkDouble,size: 14,color: Colors.black,),
                  Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: Text("$dateTime",style: TextStyle(color: Colors.black,fontSize: 12),),
                  )

                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
