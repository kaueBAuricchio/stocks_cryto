import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:stocks_cryto/app/module/app_module.dart';
import 'package:stocks_cryto/core/platform/platform_methods_implementation.dart';
import 'package:stocks_cryto/financial/data/datasource/financial_datasource_implementation.dart';
import 'package:stocks_cryto/financial/domain/repository/financial_repository_implementation.dart';
import 'package:stocks_cryto/financial/presentation/cubit/financial_cubit.dart';

void main() {
  setUpAll(() {
    initModule(AppModule());
  });

  test('Must inject Dio', () {
    final dio = Modular.get<Dio>();
    expect(dio, isA<Dio>());
  });

  test('Must inject PlatformMethods', () {
    final platformMethods = Modular.get<PlatformMethods>();
    expect(platformMethods, isA<PlatformMethods>());
  });

  test('Must inject FinancialDatasourceImplementation', () {
    final datasource = Modular.get<FinancialDatasourceImplementation>();
    expect(datasource, isA<FinancialDatasourceImplementation>());
  });

  test('Must inject FinancialRepositoryImplementation', () {
    final repository = Modular.get<FinancialRepositoryImplementation>();
    expect(repository, isA<FinancialRepositoryImplementation>());
  });

  test('Must inject FinancialCubit', () {
    final cubit = Modular.get<FinancialCubit>();
    expect(cubit, isA<FinancialCubit>());
  });
}
