import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  bool status;
  String message;
  Data data;
  AddtionalInfo addtionalInfo;
  Login({
    required this.status,
    required this.message,
    required this.data,
    required this.addtionalInfo,
  });
  factory Login.fromJson(Map<String, dynamic> json) => Login(
        status: json["Status"],
        message: json["Message"],
        data: Data.fromJson(json["Data"]),
        addtionalInfo: AddtionalInfo.fromJson(json["AddtionalInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "Data": data.toJson(),
        "AddtionalInfo": addtionalInfo.toJson(),
      };
}

class AddtionalInfo {
  AddtionalInfo({
    required this.emailVerified,
    required this.patternEnabled,
    required this.pinEnabled,
    this.profilePic,
  });

  bool emailVerified;
  bool patternEnabled;
  bool pinEnabled;
  dynamic profilePic;

  factory AddtionalInfo.fromJson(Map<String, dynamic> json) => AddtionalInfo(
        emailVerified: json["EmailVerified"],
        patternEnabled: json["PatternEnabled"],
        pinEnabled: json["PinEnabled"],
        profilePic: json["ProfilePic"],
      );

  Map<String, dynamic> toJson() => {
        "EmailVerified": emailVerified,
        "PatternEnabled": patternEnabled,
        "PinEnabled": pinEnabled,
        "ProfilePic": profilePic,
      };
}

class Data {
  Data({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    this.refreshToken,
    required this.userName,
  });

  String accessToken;
  String tokenType;
  double expiresIn;
  dynamic refreshToken;
  String userName;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        refreshToken: json["refresh_token"],
        userName: json["userName"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
        "refresh_token": refreshToken,
        "userName": userName,
      };
}
