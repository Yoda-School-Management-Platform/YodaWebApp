import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:yodawebapp/blocs/registration_form/registration_form_validator.dart';

class RegistrationFormValidatorBloc extends Object with RegistrationFormValidator {
  final _domainController = BehaviorSubject<String>();
  final _nameController = BehaviorSubject<String>();
  final _usernameController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Function(String) get domainChanged => _domainController.sink.add;
  Function(String) get nameChanged => _nameController.sink.add;
  Function(String) get usernameChanged => _usernameController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;

  Stream<String> get domain => _domainController.stream.transform(domainValidator);
  Stream<String> get name => _nameController.stream.transform(nameValidator);
  Stream<String> get username => _usernameController.stream.transform(usernameValidator);
  Stream<String> get password => _passwordController.stream.transform(passwordValidator);

  Stream<bool> get submitCheck => Rx.combineLatest4(domain, name, username, password, (d,n,u,p) => true);

  void dispose() {
    _domainController?.close();
    _nameController?.close();
    _usernameController?.close();
    _passwordController?.close();
  }

}
