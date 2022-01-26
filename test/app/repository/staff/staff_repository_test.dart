import 'package:demo_project/data/exception.dart';
import 'package:demo_project/data/network/api_end_points.dart';
import 'package:demo_project/data/network/base_api_service.dart';
import 'package:demo_project/data/network/network_api_service.dart';
import 'package:demo_project/repositories/staff_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'staff_repository_test.mocks.dart';

@GenerateMocks([NetworkApiService])
void main() {
  const mockToken = "Mock token";

  BaseApiService apiService = MockNetworkApiService();
  StaffRepository staffRepository = StaffRepository(apiService);

  when(
    apiService.postResponse(
      ApiEndPoints.login,
      {
        "username": "maz@branch1",
        "password": "123456",
      },
    ),
  ).thenAnswer(
    (_) async => {
      "branch_id": 1,
      "branch_name": 'บางมด',
      "created_timestamp": '19700101',
      "staff_id": 1,
      "token": mockToken,
      "username": 'maz@branch1',
    },
  );

  when(
    apiService.postResponse(
      ApiEndPoints.login,
      {
        "username": "wrongusername",
        "password": "123456",
      },
    ),
  ).thenAnswer(
    (_) async => throw UnauthorisedException,
  );

  when(
    apiService.getResponse(
      ApiEndPoints.info,
      token: mockToken,
    ),
  ).thenAnswer(
    (_) async => {
      "branch_id": 1,
      "branch_name": 'บางมด',
      "created_timestamp": '19700101',
      "staff_id": 1,
      "token": mockToken,
      "username": 'maz@branch1',
    },
  );

  when(
    apiService.getResponse(
      ApiEndPoints.info,
      token: '',
    ),
  ).thenAnswer(
    (_) async => throw UnauthorisedException,
  );

  group('Staff repository', () {
    test('Login with correct username password', () async {
      var response = await staffRepository.login("maz@branch1", "123456");
      expect(response.branchId, 1);
      expect(response.branchName, 'บางมด');
      expect(response.staffId, 1);
      expect(response.token, mockToken);
      expect(response.username, 'maz@branch1');
    });

    test('Login with wrong username password', () async {
      try {
        await staffRepository.login("wrongusername", "123456");
      } catch (e) {
        expect(e, UnauthorisedException);
      }
    });

    test('Fetch staff data with correct token', () async {
      var response = await staffRepository.getInfo(mockToken);
      expect(response.branchId, 1);
      expect(response.branchName, 'บางมด');
      expect(response.staffId, 1);
      expect(response.token, mockToken);
      expect(response.username, 'maz@branch1');
    });

    test('Fetch staff data with wrong token', () async {
      try {
        await staffRepository.getInfo('');
      } catch (e) {
        expect(e, UnauthorisedException);
      }
    });
  });
}
