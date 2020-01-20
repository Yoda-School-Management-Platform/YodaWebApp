import 'package:flutter/material.dart';
import 'package:yodawebapp/blocs/login_form/login_form_validator_bloc.dart';
import 'package:yodawebapp/utils/color_palette.dart';
import 'package:yodawebapp/widgets/input/standard_input.dart';

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
          child: ListView(
            children: <Widget>[
              StandardInput(stream: loginFormBloc.school, onChanged: loginFormBloc.schoolChanged,labelText: 'Schule', obscureText: false,),  //Schule
              widget.loginType != 'school' ? StandardInput(stream: loginFormBloc.username, onChanged: loginFormBloc.usernameChanged,labelText: 'Username',obscureText: false,): Container(),
              StandardInput(stream: loginFormBloc.password, onChanged: loginFormBloc.passwordChanged,labelText: 'Password',obscureText: true,),
              submitButton(loginFormBloc, widget.loginType),
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