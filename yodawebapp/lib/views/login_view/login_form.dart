import 'package:flutter/material.dart';
import 'package:yodawebapp/blocs/login_form/login_form_validator_bloc.dart';
import 'package:yodawebapp/utils/color_palette.dart';

class LoginForm extends StatefulWidget {
  final loginType;

  const LoginForm({Key key, this.loginType}) : super(key: key);

  _LoginForm createState() => _LoginForm();
}

class _LoginForm extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    final loginFormBloc = LoginFormValidatorBloc();
    return Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              schoolTextField(loginFormBloc),
              widget.loginType != 'school' ? usernameTextField(loginFormBloc): Container(),
              passwordTextField(loginFormBloc),
              submitButton(loginFormBloc, widget.loginType),
            ],
          ),
        ));
  }

  Widget schoolTextField(LoginFormValidatorBloc loginFormBloc) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: StreamBuilder(
          stream: loginFormBloc.school,
          builder: (context, snapshot) {
            return TextField(
                onChanged: loginFormBloc.schoolChanged,
                decoration: InputDecoration(
                  labelText: 'Schule',
                  errorText: snapshot.error,
                  labelStyle: TextStyle(color: Colors.grey),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 3.0,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 3.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide:
                      BorderSide(width: 3.0, color: ColorPalette.yellow)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ));
          }
      ),
    );
  }


  Widget usernameTextField(LoginFormValidatorBloc loginFormBloc) {
    return Padding(
        padding: EdgeInsets.only(top: 20),
        child: StreamBuilder(
          stream: loginFormBloc.username,
          builder: (context, snapshot) {
            return TextField(
                onChanged: loginFormBloc.usernameChanged,
                decoration: InputDecoration(
                  labelText: 'Username',
                  errorText: snapshot.error,
                  labelStyle: TextStyle(color: Colors.grey),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 3.0,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 3.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide:
                      BorderSide(width: 3.0, color: ColorPalette.yellow)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ));
          },
        )
    );
  }

  Widget passwordTextField(LoginFormValidatorBloc loginFormBloc) {
    return Padding(
        padding: EdgeInsets.only(top: 20),
        child: StreamBuilder(
          stream: loginFormBloc.password,
          builder: (context, snapshot) {
            return TextField(obscureText: true,
                onChanged: loginFormBloc.passwordChanged,
                decoration: InputDecoration(
                  labelText: 'Passwort',
                  errorText: snapshot.error,
                  labelStyle: TextStyle(color: Colors.grey),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 3.0,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 3.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide:
                      BorderSide(width: 3.0, color: ColorPalette.yellow)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ));
          },
        )
    );
  }

  Widget submitButton(loginFormBloc, loginType) {
    return StreamBuilder<bool>(
        stream: loginType != 'school' ? loginFormBloc.schoolSubmitCheck : loginFormBloc.submitCheck,
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
                              child: Text("Login", style: TextStyle(color: Colors.white),),
                            ),
                          )
                      ),)
                )
            )
    );
  }


  _submit() {
    print("Login");
  }

}