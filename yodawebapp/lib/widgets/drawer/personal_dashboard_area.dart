import 'package:flutter/material.dart';
import 'package:yodawebapp/utils/color_palette.dart';

class PersonalDashboardArea extends StatelessWidget {

  Widget build(BuildContext context) {

    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            height: 150,
            decoration: BoxDecoration(
                gradient: ColorPalette.yellowPurpleBlueGradient
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 105),
            child: Row(
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    child: Container(
                        decoration: BoxDecoration(
                            gradient: ColorPalette.yellowPurpleBlueGradient
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 50,
                          ),
                        )
                    )
                ),
                Text('Gymnasium Buckhorn', style: TextStyle(color: Colors.white, fontSize: 18),)
              ],
            ),
          )
        ],
      ),
    );
  }


}