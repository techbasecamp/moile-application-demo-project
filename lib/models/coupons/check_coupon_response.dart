// To parse this JSON data, do
//
//     final checkCouponResponse = checkCouponResponseFromJson(jsonString);

import 'dart:convert';

CheckCouponResponse checkCouponResponseFromJson(String str) =>
    CheckCouponResponse.fromJson(json.decode(str));

String checkCouponResponseToJson(CheckCouponResponse data) =>
    json.encode(data.toJson());

class CheckCouponResponse {
  CheckCouponResponse({
    required this.validCoupon,
    required this.messageTh,
    required this.messageEn,
    required this.memberFirstname,
    required this.memberId,
    required this.memberLastname,
    required this.menu,
    required this.promotionId,
    required this.promotionImage,
    required this.promotionTitle,
    required this.status,
    required this.statusDescription,
  });

  final bool validCoupon;
  final String messageTh;
  final String messageEn;
  final String memberFirstname;
  final int memberId;
  final String memberLastname;
  final List<Menu> menu;
  final int promotionId;
  final String promotionImage;
  final String promotionTitle;
  final String status;
  final String statusDescription;

  factory CheckCouponResponse.fromJson(Map<String, dynamic> json) =>
      CheckCouponResponse(
        validCoupon: json["valid_coupon"],
        messageTh: json["message_th"],
        messageEn: json["message_en"],
        memberFirstname: json["member_firstname"],
        memberId: json["member_id"],
        memberLastname: json["member_lastname"],
        menu: json["menu"] == null
            ? []
            : List<Menu>.from(json["menu"].map((x) => Menu.fromJson(x))),
        promotionId: json["promotion_id"],
        promotionImage: json["promotion_image"],
        promotionTitle: json["promotion_title"],
        status: json["status"],
        statusDescription: json["status_description"],
      );

  Map<String, dynamic> toJson() => {
        "valid_coupon": validCoupon,
        "message_th": messageTh,
        "message_en": messageEn,
        "member_firstname": memberFirstname,
        "member_id": memberId,
        "member_lastname": memberLastname,
        "menu": List<dynamic>.from(menu.map((x) => x.toJson())),
        "promotion_id": promotionId,
        "promotion_image": promotionImage,
        "promotion_title": promotionTitle,
        "status": status,
        "status_description": statusDescription,
      };
}

class Menu {
  Menu({
    required this.freeMenuId,
    required this.freeMenuMaxQty,
    required this.freeMenuMinQty,
    required this.menuName,
    required this.qrcode,
  });

  final String freeMenuId;
  final String freeMenuMaxQty;
  final String freeMenuMinQty;
  final String menuName;
  final String qrcode;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        freeMenuId: json["free_menu_id"],
        freeMenuMaxQty: json["free_menu_max_qty"],
        freeMenuMinQty: json["free_menu_min_qty"],
        menuName: json["menu_name"],
        qrcode: json["qrcode"],
      );

  Map<String, dynamic> toJson() => {
        "free_menu_id": freeMenuId,
        "free_menu_max_qty": freeMenuMaxQty,
        "free_menu_min_qty": freeMenuMinQty,
        "menu_name": menuName,
      };
}
