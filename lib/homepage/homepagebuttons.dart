import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeButton extends StatelessWidget {
  final VoidCallback callbackFunction;
  final String string;
  final Color color;
  final Icon icon;

  const HomeButton({Key key, this.callbackFunction, this.string, this.color, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MaterialButton(
          onPressed: callbackFunction,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(string, textAlign: TextAlign.center,),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  icon,
                ],
              ),
              Padding(padding:EdgeInsets.symmetric(horizontal: 0)),
            ],
          ),
          color: color,
          shape: const StadiumBorder(),
        ),
      ],
    );
  }
}