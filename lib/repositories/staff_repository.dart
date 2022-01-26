import 'package:demo_project/data/network/api_end_points.dart';
import 'package:demo_project/data/network/base_api_service.dart';
import 'package:demo_project/models/staff/staff_response.dart';

abstract class IStaffRepository {
  Future<StaffResponse> login(String username, String password);
  Future<StaffResponse> getInfo(String token);
}

class StaffRepository implements IStaffRepository {
  late final BaseApiService _apiService;

  StaffRepository(this._apiService);

  @override
  Future<StaffResponse> login(String username, String password) async {
    var response = await _apiService.postResponse(
      ApiEndPoints.login,
      {
        "username": username,
        "password": password,
      },
    );
    return StaffResponse.fromJson(response);
  }

  @override
  Future<StaffResponse> getInfo(String token) async {
    var response = await _apiService.getResponse(
      ApiEndPoints.info,
      token: token,
    );
    return StaffResponse.fromJson(response);
  }
}
