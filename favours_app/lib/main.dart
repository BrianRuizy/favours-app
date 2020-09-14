import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:favours_app/pages/home_page.dart';
import 'package:favours_app/pages/inbox_page.dart';
import 'package:favours_app/pages/post_page.dart';
import 'package:favours_app/pages/saved_page.dart';
import 'package:favours_app/pages/profile_page.dart';

void main() => runApp(
  MaterialApp(
    title: "GNav",
    theme: ThemeData(
      primaryColor: Colors.black,
    ),
    home: MyApp()
  )
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedPage  = 0;
  final _pageOptions = [
    HomePage(), 
    PostPage(), 
    SavedPage(),
    ProfilePage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favours app'),
      ),
      body: Center(
        child: _pageOptions.elementAt(_selectedPage),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(                                           
            topRight: Radius.circular(30), 
            topLeft: Radius.circular(30)
          ),
          color: Colors.white, 
          boxShadow: [BoxShadow(blurRadius: 20, color: Colors.grey[300])]
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 8,
                color: Colors.grey,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Colors.grey[800],
                tabs: [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                    backgroundColor: Colors.deepPurple[100],
                    iconActiveColor: Colors.deepPurple[800],
                    textColor: Colors.deepPurple[800],
                  ),
                  // GButton(
                  //   icon: Icons.message,
                  //   text: 'Inbox',
                  //   backgroundColor: Colors.blue[100],
                  //   iconActiveColor: Colors.blue[800],
                  //   textColor: Colors.blue[800],
                  // ),
                  GButton(
                    icon: Icons.add,
                    text: 'New',
                    backgroundColor: Colors.blueGrey[100],
                    iconActiveColor: Colors.blueGrey[800],
                    textColor: Colors.blueGrey[800],
                  ),
                  GButton(
                    icon: Icons.favorite,
                    text: 'Saved',
                    backgroundColor: Colors.pink[100],
                    iconActiveColor: Colors.pink[800],
                    textColor: Colors.pink[800],
                  ),
                  GButton(
                    icon: Icons.person,
                    text: 'Profile',
                    backgroundColor: Colors.teal[100],
                    iconActiveColor: Colors.teal[800],
                    textColor: Colors.teal[800],
                  ),
                ],
                selectedIndex: _selectedPage,
                onTabChange: (index) {
                  setState(() {
                    _selectedPage = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}

  