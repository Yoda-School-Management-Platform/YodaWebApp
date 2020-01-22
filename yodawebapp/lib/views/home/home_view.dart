
import 'package:flutter/material.dart';

import 'package:yodawebapp/utils/responsive_layout.dart';
import 'package:yodawebapp/views/registration/registration_view.dart';
import 'package:yodawebapp/widgets/animation/animated_background.dart';
import 'package:yodawebapp/widgets/buttons/button.dart';
import 'package:yodawebapp/widgets/navigation_bar/navigation_bar.dart';
import 'package:yodawebapp/widgets/search/search.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xFFF8FBFF),
        Color(0xFFFCFDFD),
      ])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: <Widget>[
              NavBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Body()
                ),
              )
            ],
          )),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: LargeChild(),
      smallScreen: SmallChild(),
    );
  }
}

class LargeChild extends StatefulWidget {
  _LargeChild createState() => _LargeChild();
}

class _LargeChild extends State<LargeChild> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SizedBox(
      height: 1080,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
              color: Colors.red,
              child: AnimatedBackground()
          ),
          FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: .6,
            child: Padding(
              padding: EdgeInsets.only(left: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Hello!",
                      style: TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  RichText(
                    text: TextSpan(
                        text: "WellCome To ",
                        style: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        children: [
                          TextSpan(
                              text: "YODA",
                              style: TextStyle(
                                  fontSize: 80,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))
                        ]),
                  ),
                  Row(
                    children: <Widget>[
                      Text('Jetzt registrieren', style: TextStyle(fontSize: 30,
                          fontWeight: FontWeight.bold, color: Colors.white),),
                     Button(text: 'Registrieren',color: Colors.white, textColor: Colors.black, onTap: () {Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => RegistrationView()),
                     );},)
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SmallChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Hello!",
              style: TextStyle(
                  fontSize: 40,
                  color: Color(0xFF8591B0),
                  fontWeight: FontWeight.bold,
                  fontFamily: "Montserrat-Regular"),
            ),
            RichText(
              text: TextSpan(
                text: 'WellCome To ',
                style: TextStyle(fontSize: 40, color: Color(0xFF8591B0)),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Britu',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.black87)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 20),
              child: Text("LET’S EXPLORE THE WORLD"),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Image.network(
                "assets/image_01.png",
                scale: 1,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Search(),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
