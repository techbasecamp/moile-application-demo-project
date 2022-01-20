import 'package:demo_project/data/network/api_end_points.dart';
import 'package:demo_project/data/network/base_api_service.dart';
import 'package:demo_project/models/staff/login_response.dart';

abstract class IStaffRepository {
  Future<LoginResponse> login(String username, String password);
}

class StaffRepository implements IStaffRepository {
  late final BaseApiService apiService;

  StaffRepository(this.apiService);

  @override
  Future<LoginResponse> login(String username, String password) async {
    try {
      var response = await apiService.postResponse(
        ApiEndPoints.login,
        {
          "username": username,
          "password": password,
        },
      );
      return LoginResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
