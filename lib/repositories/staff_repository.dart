import 'package:demo_project/data/network/api_end_points.dart';
import 'package:demo_project/data/network/base_api_service.dart';
import 'package:demo_project/models/staff/login_response.dart';

abstract class IStaffRepository {
  Future<StaffResponse> login(String username, String password);
  Future<StaffResponse> getInfo(String token);
}

class StaffRepository implements IStaffRepository {
  late final BaseApiService _apiService;

  StaffRepository(this._apiService);

  @override
  Future<StaffResponse> login(String username, String password) async {
    try {
      var response = await _apiService.postResponse(
        ApiEndPoints.login,
        {
          "username": username,
          "password": password,
        },
      );
      return StaffResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<StaffResponse> getInfo(String token) async {
    try {
      var response = await _apiService.getResponse(
        ApiEndPoints.info,
        token: token,
      );
      return StaffResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
