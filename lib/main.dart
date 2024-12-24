
import 'package:expense_app/data/local/db_helper.dart';
import 'package:expense_app/ui/bloc/expense_bloc.dart';
import 'package:expense_app/ui/bottom_navi_pages/home_page.dart';
import 'package:expense_app/ui/intro_page.dart';
import 'package:expense_app/ui/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';


void main() {
  runApp(BlocProvider(
    create: (context) => ExpenseBloc(dbHelper: DbHelper.instance),
      child: const MyApp()));
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


