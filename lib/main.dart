import 'package:banking_ui/constants.dart';
import 'package:banking_ui/screens/cards.dart';
import 'package:banking_ui/screens/history.dart';
import 'package:banking_ui/screens/home_page.dart';
import 'package:banking_ui/screens/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  Widget _selectedWidget = HomePage();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (_selectedIndex) {
        case 0:
          _selectedWidget = HomePage();
          break;
        case 1:
          _selectedWidget = History();
          break;
        case 3:
          _selectedWidget = Cards();
          break;
        case 4:
          _selectedWidget = Profile();
          break;
      }
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: appBackgroundColor,

        // This is the theme of your application.
      ),
      home: Scaffold(
        body: SafeArea(child: _selectedWidget),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xffEFF1F5),
          //To show the background color of bottomnavigationbar, make it fixed.
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 35), title: Text(HomePage.id)),
            BottomNavigationBarItem(
                icon: Icon(Icons.history, size: 35), title: Text(History.id)),
            BottomNavigationBarItem(
                icon: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: appBackgroundColor),
                  child: Icon(
                    Icons.add,color: Colors.white.withOpacity(0.8),
                    size: 20,
                  ),
                ),
                title: Text('')),
            BottomNavigationBarItem(
                icon: Icon(Icons.credit_card, size: 35), title: Text(Cards.id)),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, size: 35), title: Text(Profile.id))
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: textBody1,
          unselectedItemColor: textBody2,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
