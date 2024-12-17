
import 'package:expense_app/ui/bottom_navi_pages/expense_page.dart';
import 'package:flutter/material.dart';
import '../bottom_navi_pages/add_expense_page.dart';
import '../bottom_navi_pages/home_page.dart';
import '../bottom_navi_pages/profile_page.dart';
import '../bottom_navi_pages/notification_page.dart';

class BottomNavigationPage extends StatefulWidget{
  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int selectedIndex = 0;

  List<Widget>navPages = [
    HomePage(),
    ExpencePage(),
    AddPage(),
    NotificationPage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navPages[selectedIndex],
        bottomNavigationBar: NavigationBar(
          indicatorColor: Color(0xffe78bbc),
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: ""),
            NavigationDestination(icon: Icon(Icons.bar_chart), label: ""),
            NavigationDestination(icon: Icon(Icons.add), label: ""),
            NavigationDestination(icon: Icon(Icons.notifications_none_rounded), label: ""),
            NavigationDestination(icon: Icon(Icons.person), label: "")
          ],
          selectedIndex: selectedIndex,
          onDestinationSelected: (value){
            selectedIndex = value;
            setState(() {

            });

          },

        )
    );
  }
}