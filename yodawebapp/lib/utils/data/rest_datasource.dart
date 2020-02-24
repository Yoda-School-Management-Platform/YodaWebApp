
import 'dart:convert';
import 'package:yodawebapp/user/user.dart';
import 'package:yodawebapp/utils/network_util/network_util.dart';
import 'package:http/http.dart' as http;

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();

  static final BASE_URL = "http://localhost:8080/api/v1/";
  static final USER_URL = "user/";

  static final TOKEN_URL = "auth/token";

  Future<User> login(String school, String username, String password) async {

    var body = jsonEncode({
      "username": username,
      "password": password,
      "schoolName": school
    });

    return http.post(BASE_URL + USER_URL + TOKEN_URL, headers: {"Content-Type": "application/json"},body: body).then((http.Response response) {
      final Map res = jsonDecode(response.body);
      final int statusCode = response.statusCode;
      /*if (statusCode < 200 || statusCode > 400 || json == null) {
        print(response.statusCode.toString() + " | " + res.toString());
        throw new Exception(statusCode.toString() + ' | ' + res['message']);
      }*/
      return new User.map(res);
    });
  }
}