import 'package:flutter/material.dart';
import 'package:yodawebapp/utils/responsive_layout.dart';

class Button extends StatelessWidget {

  String text;
  Color color;
  Color textColor;
  Function onTap;
  Button({this.text, this.color, this.textColor, this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: EdgeInsets.only(left: 20),
        width: 120,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                child: Center(
                  child: Text(text,
                      style: TextStyle(
                          color: textColor,
                          letterSpacing: 1,
                          fontFamily: "Montserrat-Bold")),
                ),
              )),
        ));
  }
}