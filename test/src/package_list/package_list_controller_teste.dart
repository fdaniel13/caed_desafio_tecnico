import 'dart:convert';

import 'package:caed_desafio_tecnico/core/models/package_model.dart';
import 'package:caed_desafio_tecnico/core/package_mock.dart';
import 'package:caed_desafio_tecnico/src/package_list/package_list_controller.dart';
import 'package:caed_desafio_tecnico/src/package_list/package_list_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockPackageListRepository extends Mock implements PackageListRepository {
  @override
  Future<PackageResponse?> getPackages() async {
    return PackageResponse.fromJson(jsonDecode(packageMock));
  }

  @override
  Future<bool> eraseAcessKey() async {
    return true;
  }
}

void main() {
  final MockPackageListRepository mockPackageListRepository =
      MockPackageListRepository();
  final packageListController =
      PackageListController(mockPackageListRepository);

  setUp(() {});

  test('Should packageResponse not be null', () async {
    await packageListController.getPackages();
    expect(packageListController.packageResponse, isNotNull);
  });

  test('Should return pacotesRecebidos', () async {
    await packageListController.getPackages();
    expect(packageListController.packageResponse?.pacotesRecebidos, 100);
  });
}
