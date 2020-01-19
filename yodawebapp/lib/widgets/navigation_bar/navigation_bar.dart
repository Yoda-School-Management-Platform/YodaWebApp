import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yodawebapp/utils/responsive_layout.dart';
import 'package:yodawebapp/views/login_view/login_view.dart';

class NavBar extends StatelessWidget {
  final navLinks = ["Home", "Products", "Features", "Security", "Contact"];

  List<Widget> navItem() {
    return navLinks.map((text) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          text,
          style: TextStyle(
              fontFamily: "Montserrat-Bold",
              fontSize: 15.0,
              color: Color.fromRGBO(251, 209, 128, 1)),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Color.fromRGBO(40, 40, 40, 1),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 45, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: LinearGradient(
                            colors: [
                              Color(0xFFF2C139),
                              Color(0xFFCE768D),
                              Color(0xFF7932CD),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    child: Center(
                      child: Text("Y",
                          style: TextStyle(fontSize: 30, color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text("YODA",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: Color.fromRGBO(251, 209, 128, 1)))
                ],
              ),
              !ResponsiveLayout.isSmallScreen(context)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                          Row(
                            children: navItem(),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 20),
                              width: 120,
                              height: 40,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFF2C139),
                                      Color(0xFFCE768D),
                                      Color(0xFF7932CD),
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        showLogin(context);
                                      },
                                      child: Center(
                                        child: Text("Login",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                letterSpacing: 1,
                                                fontFamily: "Montserrat-Bold")),
                                      ),
                                    )),
                              )),
                        ])
                  : Image.network("assets/images/menu.png",
                      width: 26, height: 26),
            ],
          ),
        ));
  }

  Future<void> showLogin(context) async {
    showDialog(context: context,
    builder: (BuildContext ctx) {
      return LoginView();
    }
    );
  }

}
