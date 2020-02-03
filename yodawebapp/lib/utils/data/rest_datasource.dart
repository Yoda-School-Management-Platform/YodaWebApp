
import 'package:yodawebapp/utils/network_util/network_util.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "http://www.mocky.io/v2/5e38359b3100006a00d38069";

  Future<String> login(String school, String username, String password) {
    return _netUtil.post(BASE_URL, body: {
      "school": school,
      "uid": username,
      "pwd": password,
    }).then((dynamic res) {
      print(res.toString());
      return res;
    });
  }
}