
import 'package:expense_app/ui/bottom_navi_pages/home_page.dart';
import 'package:expense_app/ui/intro_page.dart';
import 'package:expense_app/ui/splash_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense App',

      home: SplashPage()
    );
  }
}


