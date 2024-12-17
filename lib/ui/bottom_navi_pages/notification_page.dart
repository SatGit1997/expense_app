import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      body: Center(
        child: Text('Notification',style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600
        ),),
      ),
    );
  }
}