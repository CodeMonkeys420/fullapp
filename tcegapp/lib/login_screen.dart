import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/material.dart';
import 'flutter_login.dart';
import 'constants.dart';
import 'custom_route.dart';

import 'users.dart';
import 'main.dart';
class LoginScreen extends StatelessWidget {
  static const routeName = '/auth';

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  Future<String> _loginUser(LoginData data) {
    return Future.delayed(loginTime).then((_) {
      if (!mockUsers.containsKey(data.name)) {
        return 'Username not exists';
      }
      if (mockUsers[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      if (!mockUsers.containsKey(name)) {
        return 'Username not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final inputBorder = BorderRadius.vertical(
      bottom: Radius.circular(10.0),
      top: Radius.circular(10.0),
    );

    Padding(
      padding: const EdgeInsets.all(8.0),
        
      );

    return Padding(
      padding: const EdgeInsets.fromLTRB(0,30,0,0),//step 2
      child: FlutterLogin(//step 1=kliek op flutterlogin - light bulb- wrap in padding
        title: Constants.appName,
        logo: 'Assets/vdv.png',
        logoTag: Constants.logoTag,
        titleTag: Constants.titleTag,

        emailValidator: (value) {
          if (!value.contains('@') || !value.endsWith('.com')) {
            return "Email must contain '@' and end with '.com'";
          }
          return null;
        },
        passwordValidator: (value) {
          if (value.isEmpty) {
            return 'Password is empty';
          }
          return null;
        },
        onLogin: (loginData) {
          print('Login info');
          print('Name: ${loginData.name}');
          print('Password: ${loginData.password}');
          var name =loginData.name;

          return _loginUser(loginData);
        },
        onSignup: (loginData) {
          print('Signup info');
          print('Name: ${loginData.name}');
          print('Password: ${loginData.password}');
          return _loginUser(loginData);
        },
        onSubmitAnimationCompleted: () {
          Navigator.of(context).pushReplacement(FadePageRoute(
            builder: (context) => MyHomePage(),
          ));






        },
        onRecoverPassword: (name) {
          print('Recover password info');
          print('Name: $name');
          return _recoverPassword(name);
          // Show new password dialog
        },
        showDebugButtons: true,
      ),
    );
  }
}
