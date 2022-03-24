import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mark_it/FrontEnd/Homepage.dart';
import 'package:mark_it/FrontEnd/LoginScreen.dart';
import 'package:mark_it/Working/face_detector.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Homepage.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        Homepage.id: (context) => Homepage(),
        FaceDetectorView.id: (context) => const FaceDetectorView(),
      },
    );
  }
}
