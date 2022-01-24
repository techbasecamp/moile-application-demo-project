// Mocks generated by Mockito 5.0.17 from annotations
// in demo_project/test/app/service/staff/staff_service_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:demo_project/data/local/local_storage.dart' as _i5;
import 'package:demo_project/models/staff/login_response.dart' as _i2;
import 'package:demo_project/repositories/staff_repository.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeStaffResponse_0 extends _i1.Fake implements _i2.StaffResponse {}

/// A class which mocks [StaffRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockStaffRepository extends _i1.Mock implements _i3.StaffRepository {
  MockStaffRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.StaffResponse> login(String? username, String? password) =>
      (super.noSuchMethod(Invocation.method(#login, [username, password]),
              returnValue:
                  Future<_i2.StaffResponse>.value(_FakeStaffResponse_0()))
          as _i4.Future<_i2.StaffResponse>);
  @override
  _i4.Future<_i2.StaffResponse> getInfo(String? token) => (super.noSuchMethod(
          Invocation.method(#getInfo, [token]),
          returnValue: Future<_i2.StaffResponse>.value(_FakeStaffResponse_0()))
      as _i4.Future<_i2.StaffResponse>);
}

/// A class which mocks [LocalStorage].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalStorage extends _i1.Mock implements _i5.LocalStorage {
  MockLocalStorage() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<String?> getString(String? key) =>
      (super.noSuchMethod(Invocation.method(#getString, [key]),
          returnValue: Future<String?>.value()) as _i4.Future<String?>);
  @override
  _i4.Future<void> setString(String? key, String? value) =>
      (super.noSuchMethod(Invocation.method(#setString, [key, value]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> remove(String? key) =>
      (super.noSuchMethod(Invocation.method(#remove, [key]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
}