// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

StaffResponse loginResponseFromJson(String str) =>
    StaffResponse.fromJson(json.decode(str));

String loginResponseToJson(StaffResponse data) => json.encode(data.toJson());

class StaffResponse {
  StaffResponse({
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

  factory StaffResponse.fromJson(Map<String, dynamic> json) => StaffResponse(
        staffId: json["staff_id"],
        username: json["username"],
        branchId: json["branch_id"],
        branchName: json["branch_name"],
        createdTimestamp: DateTime.parse(json["created_timestamp"]),
        token: json["token"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "staff_id": staffId,
        "username": username,
        "branch_id": branchId,
        "created_timestamp": createdTimestamp.toIso8601String(),
        "token": token,
      };
}
