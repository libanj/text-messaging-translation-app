import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:text_messaging_app/Login/loginmethod.dart';
import 'package:text_messaging_app/Homepage/homepagebuttons.dart';

class LoginPage extends StatefulWidget {
  static const String identification = "login";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;
  String password;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (input) => email = input,
            decoration: InputDecoration(
              hintText: "Email",
              border: const OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          TextField(
            autocorrect: false,
            obscureText: true,
            onChanged: (input) => password = input,
            decoration: InputDecoration(
              hintText: "Password",
              border: const OutlineInputBorder(),
            ),
          ),
          HomeButton(
            string: "Login",
            callbackFunction: () async { await login(email, password, context); },
            color: Colors.orange,
            icon: Icon(Icons.account_circle),
          )
        ],
      ),
    );
  }
}