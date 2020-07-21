import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:text_messaging_app/Chat/chatmethod.dart';
import 'package:text_messaging_app/send.dart';

class ChatPage extends StatefulWidget {
  static const String identification = "chat";
  final FirebaseUser currentUser;

  const ChatPage({Key key, this.currentUser}) : super(key: key);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final Firestore fs = Firestore.instance;

  TextEditingController msgController = TextEditingController();
  ScrollController scroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              auth.signOut();
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: StreamBuilder(
                stream: fs.collection("messages").orderBy("msgDateTime", descending: true).snapshots(),
                builder: (context, snapshot) {
                  return showChats(snapshot, widget.currentUser, scroll);
                },
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Input message",
                        border: const OutlineInputBorder(),
                      ),
                      controller: msgController,
                    ),
                  ),
                  Send(
                    voidcallback: () => sendMessage(widget.currentUser, fs, msgController, scroll)
                  )
                ],
              )
            )
          ],
        )
      ),
    );
  }
}