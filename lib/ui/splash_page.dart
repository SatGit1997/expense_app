import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'on_boarding/login_page.dart';

class SplashPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(
          context, MaterialPageRoute(
          builder: (context)=> LoginPage()));
    },);
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/monety_logo.png"),
          )
        ),
      ),
    );
  }
}