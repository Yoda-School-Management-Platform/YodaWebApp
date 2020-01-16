import 'package:flutter/material.dart';
import 'package:yodawebapp/utils/responsive_layout.dart';

class SendButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
            height: 40,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFFF2C139),
                  Color(0xFFCE768D),
                  Color(0xFF7932CD),
                ], begin: Alignment.topRight, end: Alignment.bottomLeft),
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFF6078ea).withOpacity(.3),
                      offset: Offset(0.0, 8.0),
                      blurRadius: 8.0)
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Notify",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Montserrat-Bold",
                                fontSize: ResponsiveLayout.isSmallScreen(
                                        context)
                                    ? 12
                                    : ResponsiveLayout.isMediumScreen(context)
                                        ? 12
                                        : 16,
                                letterSpacing: 1.0)),
                        SizedBox(
                          width: ResponsiveLayout.isSmallScreen(context)
                              ? 4
                              : ResponsiveLayout.isMediumScreen(context)
                                  ? 6
                                  : 8,
                        ),
                        Image.network(
                          "assets/images/sent.png",
                          color: Colors.white,
                          width: ResponsiveLayout.isSmallScreen(context)
                              ? 12
                              : ResponsiveLayout.isMediumScreen(context)
                                  ? 12
                                  : 20,
                          height: ResponsiveLayout.isSmallScreen(context)
                              ? 12
                              : ResponsiveLayout.isMediumScreen(context)
                                  ? 12
                                  : 20,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}
