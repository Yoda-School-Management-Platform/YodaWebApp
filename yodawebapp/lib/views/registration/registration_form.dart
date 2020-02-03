import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yodawebapp/blocs/registration_form/registration_form_validator_bloc.dart';
import 'package:yodawebapp/formatter/DomainFormatter.dart';
import 'package:yodawebapp/utils/color_palette.dart';
import 'package:yodawebapp/utils/const.dart';
import 'package:yodawebapp/views/loading/loading_view.dart';
import 'package:yodawebapp/widgets/input/standard_input.dart';

class RegistrationForm extends StatefulWidget {


  _RegistrationForm createState() => _RegistrationForm();
}

class _RegistrationForm extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final domainTextController = TextEditingController();

  Widget build(BuildContext context) {
    final registrationFormBloc = RegistrationFormValidatorBloc();
    domainTextController.text = '.' + Const.STANDARD_DOMAIN;
    return Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: ListView(
            children: <Widget>[
              StandardInput(stream: registrationFormBloc.domain,
                onChanged: registrationFormBloc.domainChanged,
                labelText: 'Domain', controller: domainTextController, inputFormatters: [new DomainFormatter()],),
              StandardInput(stream: registrationFormBloc.name,
                onChanged: registrationFormBloc.nameChanged,
                labelText: 'Schule-Name',), //Schule
              StandardInput(stream: registrationFormBloc.username,
                onChanged: registrationFormBloc.usernameChanged,
                labelText: 'Username'),
              StandardInput(stream: registrationFormBloc.password,
                onChanged: registrationFormBloc.passwordChanged,
                labelText: 'Password',
                obscureText: true,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 70),
                child: submitButton(registrationFormBloc),
              ),
            ],
          ),
        ));
  }

  text() {
    print("calles");
    //domainTextController.text += Const.STANDARD_DOMAIN;
  }

  Widget submitButton(registrationFormBloc) {
    return StreamBuilder<bool>(
        stream: registrationFormBloc.submitCheck,
        builder: (context, snapshot) =>
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                          onTap: snapshot.hasData ? () => _submit() : null,
                          child: Container(
                            width: 120,
                            height: 40,
                            decoration: snapshot.hasData ? BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFF2C139),
                                    Color(0xFFCE768D),
                                    Color(0xFF7932CD),
                                  ],
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft),
                            ) : BoxDecoration(
                              color: Colors.black,
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFF2C139).withOpacity(0.4),
                                    Color(0xFFCE768D).withOpacity(0.4),
                                    Color(0xFF7932CD).withOpacity(0.4),
                                  ],
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft),),
                            child: Center(
                              child: Text("Registrieren",
                                style: TextStyle(color: Colors.white),),
                            ),
                          )
                      ),)
                )
            )
    );
  }


  _submit() {
    Navigator.pushNamed(
      context, '/loading'
    );
  }

}