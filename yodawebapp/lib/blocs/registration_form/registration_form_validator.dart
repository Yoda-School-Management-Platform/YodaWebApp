import 'dart:async';

import 'package:yodawebapp/utils/const.dart';

mixin RegistrationFormValidator {

  var domainValidator = StreamTransformer<String,String>.fromHandlers(
      handleData: (domain, sink) {
        if(domain.length > 5) {
          sink.add(domain);
        } else {
          sink.addError("Schule zu kurz");
        }
      }
  );

  var nameValidator = StreamTransformer<String,String>.fromHandlers(
      handleData: (school, sink) {
        if(school.length > 5) {
          sink.add(school);
        } else {
          sink.addError("Schule zu kurz");
        }
      }
  );

  var usernameValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (username, sink) {
      if(username.length > 5) {
        sink.add(username);
      } else {
        sink.addError("Username zu kurz");
      }
    }
  );

  var passwordValidator = StreamTransformer<String,String>.fromHandlers(
      handleData: (username, sink) {
        if(username.length > 6) {
          sink.add(username);
        } else {
          sink.addError("Passwort zu kurz");
        }
      }
  );


}