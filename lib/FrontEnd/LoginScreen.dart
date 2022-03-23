import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:mark_it/FrontEnd/Homepage.dart';

import '../Backend/login.dart';

const users = {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatelessWidget {
  static String id = "LoginScreen";
  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) async {
      bool res = await login(email: data.name, password: data.password);
      if (res) {
        print('Successful Login');
      } else {
        print("Unsuccessful login");
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'MarkIt',
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Homepage(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
