import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:text_messaging_app/homepage/homepagebuttons.dart';

import 'registermethod.dart';

class RegisterPage extends StatefulWidget {
  static const String identification = "register";
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
            string: "Register",
            callbackFunction: () async { await register(email, password, context);},
            color: Colors.orange,
            icon: Icon(Icons.input),
          )
        ],
      ),
    );
  }
}