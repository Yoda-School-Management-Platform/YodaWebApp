import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:yodawebapp/blocs/login_form/login_form_validator.dart';

class LoginFormValidatorBloc extends Object with LoginFormValidator {
  final _schoolController = BehaviorSubject<String>();
  final _usernameController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Function(String) get schoolChanged => _schoolController.sink.add;
  Function(String) get usernameChanged => _usernameController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;

  Stream<String> get school => _schoolController.stream.transform(schoolValidator);
  Stream<String> get username => _usernameController.stream.transform(usernameValidator);
  Stream<String> get password => _passwordController.stream.transform(passwordValidator);

  Stream<bool> get submitCheck => Rx.combineLatest2(school, password, (u,p) => true);
  Stream<bool> get schoolSubmitCheck => Rx.combineLatest3(school, username, password, (s,u,p) => true);

  void dispose() {
    _usernameController?.close();
    _passwordController?.close();
  }

}
