import 'package:demo_project/models/staff/login_response.dart';
import 'package:demo_project/repositories/staff_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IStaffService {
  String get branchName;
  Future<void> login(String username, String password);
  Future<void> fetchInfo();
  Future<void> logout();
}

class StaffService implements IStaffService {
  String _branchName = "";
  late final IStaffRepository _repository;

  StaffService(this._repository);

  @override
  String get branchName => _branchName;

  @override
  Future<void> login(String username, String password) async {
    StaffResponse? response;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      response = await _repository.login(username, password);
    } catch (e) {
      rethrow;
    }

    _branchName = response.branchName;
    await prefs.setString("TOKEN", response.token);
  }

  @override
  Future<void> fetchInfo() async {
    StaffResponse? response;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("TOKEN");

    try {
      response = await _repository.getInfo(token!);
    } catch (e) {
      rethrow;
    }

    _branchName = response.branchName;
  }

  @override
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("TOKEN");
  }
}
