import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:loginform/model/accountmodel.dart';

Future<dynamic> signupApi(String referralCode, String email, String username,
    String password, String confirmPassword) async {
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request(
      'POST',
      Uri.parse(
          'http://honeysteav-001-site70.dtempurl.com/api/Wallet/Register'));
  request.body = json.encode({
    "ReferralCode": referralCode,
    "Email": email,
    "Username": username,
    "Password": password,
    "ConfirmPassword": confirmPassword
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    String resString = await response.stream.bytesToString();
    var resJson = json.decode(resString);
    return Account.fromJson(resJson);
    print(resString);
  } else {
    print(response.reasonPhrase);
  }
}
