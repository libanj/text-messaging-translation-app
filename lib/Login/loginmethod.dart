import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:text_messaging_app/Chat/chatpage.dart';

Future<void> login(String email, String password, BuildContext context) async {
  final FirebaseAuth auth = FirebaseAuth.instance;

  try {
    FirebaseUser user = (await auth.signInWithEmailAndPassword(email: email.trim(), password: password)).user;

    Navigator.push(context,
      MaterialPageRoute(
        builder: (context) => ChatPage(currentUser: user,),
      )
    );

  } catch(e) {
    if (e == "ERROR_USER_NOT_FOUND") {
      
    }
    print(e);
  }
}