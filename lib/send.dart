import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Send extends StatelessWidget {
  final VoidCallback voidcallback;

  const Send({Key key, this.voidcallback}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: voidcallback,
      child: Text('Send Message'),
      color: Colors.blueAccent,
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
    );
  }
}