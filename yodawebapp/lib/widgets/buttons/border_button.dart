import 'package:flutter/material.dart';
import 'package:yodawebapp/utils/color_palette.dart';

class BorderButton extends StatelessWidget {

  String text;
  Color color;
  Function onPressed;
  BorderButton({this.text, this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.transparent,
      child: Text('Login', style: TextStyle(color: color),),
      shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(7),
          side: BorderSide(color: color, width: 2)
      ),
      onPressed: onPressed,
    );
  }
}