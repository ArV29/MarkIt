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

  Widget build(context) {
      return MaterialApp(
        home: Scaffold(
          body:
          z
          appBar: AppBar(
            title: Text(),
          ),
        ),
      );
    }
}

Widget compareButton() {
  Position employee = await _determinePosition();
  Position organisation;
  organisation.latitude=30.765616;
  organisation.longitude=76.753638;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.purple,
        padding: EdgeInsets.all(15.0),
        textStyle: TextStyle(
          color: Colors.white10,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        print(compare(organisation, employee))
      },
      child: Text('Submit'),
    );
  }

