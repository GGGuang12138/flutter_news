import 'package:flutter/material.dart';

// 登陆请求
class UserLoginRequestEntity {
  final String username;
  final String password;

  UserLoginRequestEntity({
    @required this.username,
    @required this.password,
  });

  factory UserLoginRequestEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginRequestEntity(
        username: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": username,
        "password": password,
      };
}

// 登录返回
class UserLoginResponseEntity {
  String accessToken;
  String displayName;
  List<String> channels;

  UserLoginResponseEntity({
    @required this.accessToken,
    this.displayName,
    this.channels,
  });

  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginResponseEntity(
        accessToken: json["access_token"],
        displayName: json["display_name"],
        channels: List<String>.from(json["channels"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "display_name": displayName,
        "channels": List<dynamic>.from(channels.map((x) => x)),
      };
}
