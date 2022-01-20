import 'package:demo_project/models/staff/login_response.dart';
import 'package:demo_project/repositories/staff/staff_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IStaffService {
  String? get branchName;
  Future<void> login(String username, String password);
  Future<void> logout();
}

class StaffService implements IStaffService {
  String? _branchName;
  late final IStaffRepository repository;

  StaffService(this.repository);

  @override
  Future<void> login(String username, String password) async {
    LoginResponse? response;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      response = await repository.login(username, password);
    } catch (e) {
      rethrow;
    }

    _branchName = response.branchName;
    await prefs.setString("TOKEN", response.token);
  }

  @override
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("TOKEN");
  }

  @override
  String? get branchName => _branchName;
}
