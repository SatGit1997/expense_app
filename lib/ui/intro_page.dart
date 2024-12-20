

import 'dart:async';

import 'package:expense_app/ui/on_boarding/dashboard_page.dart';
import 'package:expense_app/ui/on_boarding/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPage extends StatefulWidget{
  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  String? uid;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4),() async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      uid = prefs.getString("userId") ?? "";

      Widget navigateTo = LoginPage();

      if(uid!= ""){
        navigateTo = DashboardPage();
      }

      Navigator.pushReplacement(context, MaterialPageRoute(builder:  (context) => navigateTo));

    });

  }

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