import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Message extends StatelessWidget {
  final String outputUser;
  final String inputMsg;
  final bool user;

  const Message({Key key, this.outputUser, this.inputMsg, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: user ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(outputUser),
          Material(
            color: user ? Colors.blueAccent : Colors.greenAccent,
            borderRadius: BorderRadius.circular(10),
            elevation: 6,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Text(inputMsg),
            ),
          )
        ],
      ),
    );
  }
}