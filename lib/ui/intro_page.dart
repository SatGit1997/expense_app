

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
      FloatingActionButton(
      onPressed: (){},
      child: Icon(
        Icons.arrow_forward_rounded,color: Colors.white,),
      backgroundColor: Color(0xffe78bbc),
    ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Image(image: AssetImage("assets/images/Monetylogo_rbg.png")),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Monetylogo_rbg.png")
                )
              ),
            ),
            Image(
                image: AssetImage("assets/images/intro_bg.png")),
            Text("Easy way to monitor your expense",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w600,

              ),textAlign: TextAlign.center,
            ),

            Text("Safe your future by managing your expense right now",
              style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),textAlign: TextAlign.center,
            ),
            SizedBox(height: 50,),

          ],
        ),
      ),
    );
  }
}