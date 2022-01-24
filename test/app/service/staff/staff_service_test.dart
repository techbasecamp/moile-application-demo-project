import 'package:demo_project/assets/constants.dart';
import 'package:demo_project/data/local/base_local_storage.dart';
import 'package:demo_project/data/local/local_storage.dart';
import 'package:demo_project/models/staff/login_response.dart';
import 'package:demo_project/repositories/staff_repository.dart';
import 'package:demo_project/services/staff_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'staff_service_test.mocks.dart';

@GenerateMocks([StaffRepository, LocalStorage])
void main() {
  const mockToken = "Mock token";

  StaffResponse mockStaffResponse = StaffResponse(
    branchId: 1,
    branchName: 'บางมด',
    createdTimestamp: DateTime.now(),
    staffId: 1,
    token: mockToken,
    username: 'maz@branch1',
  );

  BaseLocalStorage storage = MockLocalStorage();
  IStaffRepository staffRepository = MockStaffRepository();
  StaffService staffService = StaffService(staffRepository, storage);

  when(storage.getString(Constant.token)).thenAnswer(
    (_) async => mockToken,
  );

  when(storage.remove(Constant.token)).thenAnswer(
    (_) async => '',
  );

  when(staffRepository.getInfo(mockToken)).thenAnswer(
    (_) async => mockStaffResponse,
  );

  when(staffRepository.login('maz@branch1', '123456')).thenAnswer(
    (_) async => mockStaffResponse,
  );

  group('Staff service', () {
    test("Initial service", () {
      expect(staffService.branchName, "");
    });

    test("Fetch Info", () async {
      await staffService.fetchInfo();
      expect(staffService.branchName, mockStaffResponse.branchName);
    });

    test("Logout", () async {
      await staffService.logout();
      expect(staffService.branchName, "");
    });

    test("login", () async {
      await staffService.login('maz@branch1', '123456');
      expect(staffService.branchName, mockStaffResponse.branchName);
    });
  });
}
