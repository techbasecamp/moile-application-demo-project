// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.staffId,
    required this.username,
    required this.branchId,
    required this.branchName,
    required this.createdTimestamp,
    required this.token,
  });

  final int staffId;
  final String username;
  final int branchId;
  final String branchName;
  final DateTime createdTimestamp;
  final String token;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        staffId: json["staff_id"],
        username: json["username"],
        branchId: json["branch_id"],
        branchName: json["branch_name"],
        createdTimestamp: DateTime.parse(json["created_timestamp"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "staff_id": staffId,
        "username": username,
        "branch_id": branchId,
        "created_timestamp": createdTimestamp.toIso8601String(),
        "token": token,
      };
}
