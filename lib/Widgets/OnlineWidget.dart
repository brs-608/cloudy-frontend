import 'package:flutter/material.dart';


class Onlinewidget extends StatelessWidget {
  String profilePic;
  String name;
  Onlinewidget({required this.profilePic,required this.name});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: 10),
      child: Stack(
          children: [
            Container(
              height: 85,
              width: 65,
              decoration: BoxDecoration(
                  color: Colors.blueGrey.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 7),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(image: NetworkImage(profilePic,scale: 1,),fit: BoxFit.fitHeight)
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(name,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Colors.black),)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 53),
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green
              ),
            ),

          ],
        ),
    );

  }
}
