import 'package:flutter/material.dart';

class radioScreen extends StatelessWidget {
  const radioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Image.asset("assets/radiomain.png"),
          SizedBox(
            height:30 ,
          ),
          Text("إذاعة القرآن الكريم",
            style:
            TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
          SizedBox(
            height:30 ,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width:40 ,
              ),
              ImageIcon(AssetImage("assets/icon1radiopage.png"),color:Color(0xFFB7935F),),
              SizedBox(
                width: 40,
              ),
              ImageIcon(AssetImage("assets/icon2radiopage.png"),color:Color(0xFFB7935F)),
              SizedBox(
                width: 40,
              ),
              ImageIcon(AssetImage("assets/icon3radiopage.png"),color:Color(0xFFB7935F)),
              SizedBox(
                width: 40,
              ),

            ],
          )

        ],
      ),
    );
  }
}
