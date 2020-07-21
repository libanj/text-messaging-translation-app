import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:text_messaging_app/Login/loginpage.dart';
import 'package:text_messaging_app/Register/registerpage.dart';
import 'package:text_messaging_app/api/google-sign-in.dart';
import 'package:text_messaging_app/Homepage/homepagebuttons.dart';

class HomePage extends StatefulWidget {
  static const String identification = "home";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Text messaging",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50.0
          ),
          HomeButton(
            string: "Log in",
            callbackFunction: () {Navigator.of(context).pushNamed(LoginPage.identification);},
            color: Colors.green,
            icon: Icon(Icons.account_box),
          ),
          HomeButton(
            string: "Sign up",
            callbackFunction: () {Navigator.of(context).pushNamed(RegisterPage.identification);},
            color: Colors.blue,
            icon: Icon(Icons.input),
          ),
          GoogleSignInButton(
            onPressed: () {handleSignIn(context);},
          ),
        ]
      ),
    );
  }
}