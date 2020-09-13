import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() => runApp(MaterialApp(
    title: "GNav",
    theme: ThemeData(
      primaryColor: Colors.black,
    ),
    home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Your inbox',
      style: optionStyle,
    ),
    Text(
      'Post a new favour!',
      style: optionStyle,
    ),
    Text(
      'Saved favours',
      style: optionStyle,
    ),
    Text(
      'Welcome, Brian',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favours app'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.25))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 8,
                activeColor: Colors.white,
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
                  GButton(
                    icon: Icons.message,
                    text: 'Inbox',
                    backgroundColor: Colors.blue[100],
                    iconActiveColor: Colors.blue[800],
                    textColor: Colors.blue[800],
                  ),
                  GButton(
                    active: true,
                    icon: Icons.add,
                    text: 'New',
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
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}

  