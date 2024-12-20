import 'dart:async';

import 'package:expense_app/ui/intro_page.dart';
import 'package:expense_app/ui/on_boarding/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SplashPage extends StatefulWidget{
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(
          context, MaterialPageRoute(
          builder: (context)=> IntroPage()));
    },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


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

