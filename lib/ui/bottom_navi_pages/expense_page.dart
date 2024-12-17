import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpencePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Center(
        child: Text('Expence',style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w600
        ),),
      ),
    );
  }
}