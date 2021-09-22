import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> editUserInfo(
    String token,
    String firstName,
    String lastName,
    String dateOdBirth,
    String gender,
    String address,
    String state,
    String country,
    String pinCode) async {
  var headers = {
    'Authorization': 'Bearer ' + token,
    'Content-Type': 'application/json'
  };
  var request = http.Request(
      'POST',
      Uri.parse(
          'http://honeysteav-001-site70.dtempurl.com/api/Wallet/SetUserInfo'));
  request.body = json.encode({
    "FirstName": firstName,
    "LastName": lastName,
    "DateOfBirth": dateOdBirth,
    "Gender": gender,
    "Address": address,
    "State": state,
    "Country": country,
    "Pincode": pinCode
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    String resString = await response.stream.bytesToString();
    var resJson = json.decode(resString);
    print(resString);
  } else {
    print(response.reasonPhrase);
  }
}
