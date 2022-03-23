import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mark_it/FrontEnd/LoginScreen.dart';
import 'package:fluttermoji/fluttermoji.dart';
import '../Backend/logout.dart';
import '../packages/geo/geo_compare.dart';
import '../packages/geo/geo_return.dart';

class Homepage extends StatefulWidget {
  static String id = 'homepage';
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                signOut();
                Navigator.pushNamedAndRemoveUntil(context, LoginScreen.id,
                    ModalRoute.withName(LoginScreen.id));
              }),
        ),
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Hello,'),
                        Text(
                          name,
                        )
                      ],
                    ),
                    FluttermojiCircleAvatar(
                      radius: 75.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
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
}
