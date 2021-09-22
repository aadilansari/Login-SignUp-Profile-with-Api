import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:loginform/model/loginmodel.dart';

Future<dynamic> loginApi(String username, String password) async {
  Login userData;
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request(
      'POST',
      Uri.parse(
          'http://honeysteav-001-site70.dtempurl.com/api/Wallet/Initialize'));
  request.body = json.encode({"Username": username, "Password": password});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    String res = await response.stream.bytesToString();
    if (res != null) {
      var jsonData = json.decode(res);
      userData = Login.fromJson(jsonData);
      print(res);
      return userData;
    }
  } else {
    print(response.reasonPhrase);
  }
}
