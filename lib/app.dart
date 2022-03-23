import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import './packages/geo/geo_compare.dart';
import './packages/geo/geo_return.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  createState() {
    return HomePageState();
  }
}

class HomePageState extends State<Homepage> {
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: compareButton(),
        appBar: AppBar(
          title: const Text("Hello"),
        ),
      ),
    );
  }
}

Widget compareButton() {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Colors.purple,
      padding: const EdgeInsets.all(15.0),
      textStyle: const TextStyle(
        color: Colors.white10,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    onPressed: () async {
      Position employee = await determinePosition();
      print(compare(employee));
    },
    child: const Text('Submit'),
  );
}
