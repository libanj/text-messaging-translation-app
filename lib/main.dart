import 'package:flutter/material.dart';
import 'package:text_messaging_app/Homepage/homepage.dart';
import 'package:text_messaging_app/Chat/chatpage.dart';
import 'package:text_messaging_app/Login/loginpage.dart';
import 'package:text_messaging_app/Register/registerpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      initialRoute: HomePage.identification,
      routes: {
        HomePage.identification: (c) => HomePage(),
        LoginPage.identification: (c) => LoginPage(),
        RegisterPage.identification: (c) => RegisterPage(),
        ChatPage.identification: (c) => ChatPage(),
      },
    );
  }
}