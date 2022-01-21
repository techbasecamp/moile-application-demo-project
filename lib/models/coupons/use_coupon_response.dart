// To parse this JSON data, do
//
//     final useCouponResponse = useCouponResponseFromJson(jsonString);

import 'dart:convert';

UseCouponResponse useCouponResponseFromJson(String str) =>
    UseCouponResponse.fromJson(json.decode(str));

String useCouponResponseToJson(UseCouponResponse data) =>
    json.encode(data.toJson());

class UseCouponResponse {
  UseCouponResponse({
    required this.staffScanHistoryId,
    required this.memberFirstname,
    required this.memberLastname,
    required this.createdTimestamp,
    required this.menu,
  });

  final int staffScanHistoryId;
  final String memberFirstname;
  final String memberLastname;
  final DateTime createdTimestamp;
  final List<UsedMenu> menu;

  factory UseCouponResponse.fromJson(Map<String, dynamic> json) =>
      UseCouponResponse(
        staffScanHistoryId: json["staff_scan_history_id"],
        memberFirstname: json["member_firstname"],
        memberLastname: json["member_lastname"],
        createdTimestamp: DateTime.parse(json["created_timestamp"])
            .add(const Duration(hours: 7)),
        menu: json["menu"] == null
            ? []
            : List<UsedMenu>.from(
                json["menu"].map((x) => UsedMenu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "staff_scan_history_id": staffScanHistoryId,
        "member_firstname": memberFirstname,
        "member_lastname": memberLastname,
        "created_timestamp": createdTimestamp.toIso8601String(),
        "menu": List<dynamic>.from(menu.map((x) => x.toJson())),
      };
}

class UsedMenu {
  UsedMenu({
    required this.menuName,
    required this.quantity,
  });

  final String menuName;
  final int quantity;

  factory UsedMenu.fromJson(Map<String, dynamic> json) => UsedMenu(
        menuName: json["menu_name"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "menu_name": menuName,
        "quantity": quantity,
      };
}
