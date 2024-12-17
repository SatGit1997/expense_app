import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent.shade200,
      body: Center(
        child: Text('Profile',style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600
        ),),
      ),
    );
  }
}