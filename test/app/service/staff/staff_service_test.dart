import 'package:demo_project/assets/constants.dart';
import 'package:demo_project/data/local/base_local_storage.dart';
import 'package:demo_project/data/local/local_storage.dart';
import 'package:demo_project/models/staff/staff_response.dart';
import 'package:demo_project/repositories/staff_repository.dart';
import 'package:demo_project/services/staff_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'staff_service_test.mocks.dart';

@GenerateMocks([StaffRepository, LocalStorage])
void main() {
  const mockToken = "Mock token";

  List<StaffResponse> mockResponses = [
    StaffResponse(
      branchId: 1,
      branchName: 'บางมด',
      createdTimestamp: DateTime.now(),
      staffId: 1,
      token: mockToken,
      username: 'maz@branch1',
    ),
    StaffResponse(
      branchId: 2,
      branchName: 'บางมด',
      createdTimestamp: DateTime.now(),
      staffId: 2,
      token: mockToken,
      username: 'maz@branch2',
    )
  ];

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
    (_) async => mockResponses[0],
  );

  when(staffRepository.login('maz@branch1', '123456')).thenAnswer(
    (_) async => mockResponses[0],
  );

  when(staffRepository.login('maz@branch2', '123456')).thenAnswer(
    (_) async => mockResponses[1],
  );

  group('Staff service', () {
    test("Initial service", () {
      expect(staffService.branchName, "");
    });

    test("Fetch Info", () async {
      await staffService.fetchInfo();
      expect(staffService.branchName, mockResponses[0].branchName);
    });

    test("Logout", () async {
      await staffService.logout();
      expect(staffService.branchName, "");
    });

    test("login", () async {
      await staffService.login('maz@branch2', '123456');
      expect(staffService.branchName, mockResponses[1].branchName);
    });
  });
}
