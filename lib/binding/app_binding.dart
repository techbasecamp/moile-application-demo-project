import 'package:demo_project/data/network/base_api_service.dart';
import 'package:demo_project/data/network/network_api_service.dart';
import 'package:demo_project/repositories/staff/staff_repository.dart';
import 'package:demo_project/services/staff_service.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(_buildStaffService, fenix: true);
  }

  IStaffService _buildStaffService() {
    BaseApiService networkApiService = NetworkApiService();
    IStaffRepository staffRepository = StaffRepository(networkApiService);
    IStaffService staffService = StaffService(staffRepository);
    return staffService;
  }
}
