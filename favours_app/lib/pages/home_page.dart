import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:favours_app/services/search_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> searchResults = [];
  searchDjango(value) async {
    SearchService.searchDjangoApi(value).then((responseBody) {
      List<dynamic> data = jsonDecode(responseBody);
      setState(() {
        data.forEach((value) { 
          // iterating the search results
          searchResults.add(value);
        });
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child:TextField(
                onChanged: (val) {
                  searchResults.clear(); //clearing cached results
                  searchDjango(val); // calling search query
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 25.0),
                  hintText: 'Search here', 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: null,
                  )
                ),
              )
            )
          ],
        )
      ),
    );
  }
}

// widget to build inside the ListView
Widget buildResultCard(data){
  return Padding(
    padding: const EdgeInsets.all(8.0), 
    child: Column(
      children: <Widget>[
        ListTile(
          title:  Text(data['name']),
          subtitle: Text(data['price'].toString()),
        ),
        Divider(color: Colors.black)
      ],
    ),
  );
}