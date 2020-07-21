import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:text_messaging_app/api/google-translate.dart';
import 'package:text_messaging_app/message.dart';

GoogleTranslate translate = new GoogleTranslate();

Future<void> sendMessage(FirebaseUser currentuser, Firestore fs, TextEditingController msgController, ScrollController scroll) async {
  if (msgController.text.length > 0) {
    String translatedText = await translate.callApi(msgController.text);
    await fs.collection("messages").add({
      "inputMsg" : translatedText,
      "outputUser" : currentuser.email,
      "msgDateTime": DateTime.now().toIso8601String().toString(),
    });
    msgController.clear();
  }
}

Widget showChats(AsyncSnapshot snapshot, FirebaseUser currentUser, ScrollController scroll) {

  if (!snapshot.hasData)
    return Center(
      child: CircularProgressIndicator(),
  );

  List<DocumentSnapshot> documents = snapshot.data.documents;

  List<Widget> texts = documents
  .map((document) => Message(
        inputMsg: document.data['inputMsg'],
        outputUser: document.data['outputUser'],
        user: currentUser.email == document.data['outputUser'],
      ))
  .toList();
  return ListView(
    reverse: true,
    controller: scroll,
    children: <Widget>[
      ... texts,
    ],
  );
}