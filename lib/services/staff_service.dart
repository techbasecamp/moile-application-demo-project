import 'package:demo_project/assets/constants.dart';
import 'package:demo_project/data/local/base_local_storage.dart';
import 'package:demo_project/models/staff/staff_response.dart';
import 'package:demo_project/repositories/staff_repository.dart';
import 'package:get/get.dart';

abstract class IStaffService {
  String get branchName;
  Future<void> login(String username, String password);
  Future<void> fetchInfo();
  Future<void> logout();
}

class StaffService extends GetxService implements IStaffService {
  String _branchName = "";

  late final IStaffRepository _repository;
  late final BaseLocalStorage _storage;

  StaffService(this._repository, this._storage);

  @override
  String get branchName => _branchName;

  @override
  Future<void> login(String username, String password) async {
    StaffResponse? response;

    try {
      response = await _repository.login(username, password);
    } catch (e) {
      rethrow;
    }

    _branchName = response.branchName;
    await _storage.setString(Constant.token, response.token);
  }

  @override
  Future<void> fetchInfo() async {
    StaffResponse? response;

    String? token = await _storage.getString(Constant.token);

    try {
      response = await _repository.getInfo(token!);
    } catch (e) {
      rethrow;
    }

    _branchName = response.branchName;
  }

  @override
  Future<void> logout() async {
    _branchName = '';
    await _storage.remove(Constant.token);
  }
}
