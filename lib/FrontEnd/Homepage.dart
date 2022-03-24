import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mark_it/FrontEnd/LoginScreen.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:mark_it/Working/face_detector.dart';
import '../Backend/logout.dart';
import '../packages/geo/geo_compare.dart';
import '../packages/geo/geo_return.dart';

class Homepage extends StatefulWidget {
  static String id = 'homepage';
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String name = 'Name';
  String attendance = 'Unmarked'; //ARV
  String days = '164 days';

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
                padding: const EdgeInsets.symmetric(
                    horizontal: 50.0, vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FluttermojiCircleAvatar(
                      radius: 50.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Today's Attendance: ",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      attendance,
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Total Days Attended: ",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      days,
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 15.0),
              ),
              FluttermojiCircleAvatar(
                radius: 50.0,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 15.0),
              ),
              compareButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget compareButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        padding: const EdgeInsets.all(15.0),
        textStyle: const TextStyle(
            color: Colors.white10, fontSize: 25.0, fontWeight: FontWeight.bold),
      ),
      onPressed: () async {
        Position employee = await determinePosition();
        print(compare(employee));
        Navigator.pushNamed(context, FaceDetectorView.id);
      },
      child: const Text('Mark It'),
    );
  }
}
