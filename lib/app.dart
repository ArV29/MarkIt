import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import './packages/geo/geo_compare.dart';
import './packages/geo/geo_return.dart';

class Homepage extends StatefulWidget{
  createState(){
    return HomepageState();
  }
}

class HomePageState extends State<Homepage>{

  Position employee = _determinePosition();
  Position organization;

  organization.longitude = 30.765616;
  organization.latitude = 76.753638;

  Widget build(context) {
      return MaterialApp(
        home: Scaffold(
          body:
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            // onPressed: () {
            //   fetchImage();
            // },
            onPressed: compare(organization, employee), // its the short form for whats written above
          ),
          appBar: AppBar(
            title: Text('Lets see some Images'),
          ),
        ),
      );
    }
}
