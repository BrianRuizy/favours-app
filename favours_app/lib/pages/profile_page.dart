import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        // The containers in the background
        new Container(
          height: MediaQuery.of(context).size.height * .25,
          decoration: BoxDecoration(
            color: Color.fromRGBO(137, 150, 176, 1),
            borderRadius: BorderRadius.only(                                           
              bottomLeft: Radius.circular(30), 
              bottomRight: Radius.circular(30)
            ),
          )
        ),
        // The card widget with top padding, 
        // incase if you wanted bottom padding to work, 
        // set the `alignment` of container to Alignment.bottomCenter
        new Container(
          alignment: Alignment.topCenter,
          padding: new EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .08,
              right: 20.0,
              left: 20.0),
          child: new Container(
            height: 200.0,
            width: MediaQuery.of(context).size.width,
            child: new Card(
              color: Colors.white,
              elevation: 15.0,
              shadowColor: Colors.grey[100],
            ),
          ),
        )
      ],
    );
  }
}