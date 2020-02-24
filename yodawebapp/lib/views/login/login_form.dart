import 'package:flutter/material.dart';
import 'package:yodawebapp/auth/auth_state/auth_state.dart';
import 'package:yodawebapp/blocs/login_form/login_form_validator_bloc.dart';
import 'package:yodawebapp/user/user.dart';
import 'package:yodawebapp/utils/color_palette.dart';
import 'package:yodawebapp/utils/data/rest_datasource.dart';
import 'package:yodawebapp/widgets/input/standard_input.dart';
import 'dart:html';

class LoginForm extends StatefulWidget {
  final loginType;

  const LoginForm({Key key, this.loginType}) : super(key: key);

  _LoginForm createState() => _LoginForm();
}

class _LoginForm extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final api = new RestDatasource();
  final auth = new AuthStateProvider();

  final schoolTextController = TextEditingController();
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();



  Widget build(BuildContext context) {
    final loginFormBloc = LoginFormValidatorBloc();
    return Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: ListView(
            children: <Widget>[
              StandardInput(stream: loginFormBloc.school, controller: schoolTextController,onChanged: loginFormBloc.schoolChanged,labelText: 'Schule'),  //Schule
              widget.loginType != 'school' ? StandardInput(stream: loginFormBloc.username, controller: usernameTextController, onChanged: loginFormBloc.usernameChanged,labelText: 'Username'): Container(),
              StandardInput(stream: loginFormBloc.password, controller: passwordTextController, onChanged: loginFormBloc.passwordChanged,labelText: 'Password',obscureText: true),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 70),
                child: submitButton(loginFormBloc, widget.loginType),
              ),
            ],
          ),
        ));
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
                          onTap: snapshot.hasData ? () => _submit() : null,//_submit() : null,
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


  void _submit() async {
    User user = await api.login(schoolTextController.text, usernameTextController.text, passwordTextController.text);
    window.localStorage['auth'] = user.authToken;
    auth.notify(AuthState.LOGGED_IN);
    Navigator.pushNamed(context, '/school');
  }
}