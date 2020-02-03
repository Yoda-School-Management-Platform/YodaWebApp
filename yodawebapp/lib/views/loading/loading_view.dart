import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  _Loading createState() => _Loading();
}

class _Loading extends State<Loading> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(
                valueColor:  new AlwaysStoppedAnimation<Color>(Colors.black),
                strokeWidth: 3.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: Text('Loading ...', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}
