import 'package:flutter/material.dart';

class InboxPage extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return Container(
        padding: EdgeInsets.all(25), 
        child: Text('Your inbox.', style: TextStyle(fontSize: 36),),
      );
    }
}