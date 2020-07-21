import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'dart:async';

import 'package:text_messaging_app/Chat/chatpage.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
FirebaseUser currentUser;
final Firestore db = Firestore.instance;

Future<void> handleSignIn(BuildContext context) async {
  GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
  GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

  AuthCredential authCredential = GoogleAuthProvider.getCredential(idToken: googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken);

  AuthResult authResult = (await _firebaseAuth.signInWithCredential(authCredential));

  currentUser = authResult.user;

  Navigator.push(context,
    MaterialPageRoute(
      builder: (context) => ChatPage(currentUser: currentUser,),
    )
  );
}