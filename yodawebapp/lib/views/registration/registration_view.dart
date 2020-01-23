import 'package:flutter/material.dart';
import 'package:yodawebapp/utils/color_palette.dart';

import 'package:yodawebapp/views/registration/registration_form.dart';


class RegistrationView extends StatefulWidget {
  _RegistrationView createState() => _RegistrationView();
}

class _RegistrationView extends State<RegistrationView> {

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 800),
          child: RegistrationForm(),
        ),
      ),
    );
  }
}



