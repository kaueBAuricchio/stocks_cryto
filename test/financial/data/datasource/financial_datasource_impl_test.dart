import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stocks_cryto/core/platform/platform_methods_implementation.dart';
import 'package:stocks_cryto/financial/data/datasource/financial_datasource_implementation.dart';
import 'package:stocks_cryto/financial/data/model/stock_model.dart';

class MockDio extends Mock implements Dio {}

class MockPlatformMethods extends Mock implements PlatformMethods {}

void main() {
  late MockDio dio;
  late MockPlatformMethods platform;
  late FinancialDatasourceImplementation datasource;

  setUp(() {
    dio = MockDio();
    platform = MockPlatformMethods();
    datasource = FinancialDatasourceImplementation(dio, platform);
  });

  group('FinancialDatasourceImplementation - listStock', () {
    test('should return list of StockModel when API returns 200', () async {
      // arrange
      when(() => platform.getApiKey()).thenReturn('1435v34r');
      when(
        () => platform.getBaseUrl(),
      ).thenReturn('https://financialdata.net/api/v1');

      final mockResponse = Response(
        requestOptions: RequestOptions(path: ''),
        statusCode: 200,
        data: [
          {"trading_symbol": "A", "registrant_name": "Agilent Technologies"},
          {"trading_symbol": "AA", "registrant_name": "Alcoa Corp"},
        ],
      );

      when(() => dio.get(any())).thenAnswer((_) async => mockResponse);

      // act
      final result = await datasource.listStock();

      // assert
      expect(result, isA<List<StockModel>>());
      expect(result.length, 2);
      expect(result.first.symbol, 'A');
      expect(result.first.name, 'Agilent Technologies');
    });

    test(
      'should throw Exception when API returns status other than 200',
      () async {
        // arrange
        when(() => platform.getApiKey()).thenReturn('1435v34r');
        when(
          () => platform.getBaseUrl(),
        ).thenReturn('https://financialdata.net/api/v1');

        final mockResponse = Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 404,
        );

        when(() => dio.get(any())).thenAnswer((_) async => mockResponse);

        // act
        final call = datasource.listStock;

        // assert
        expect(() => call(), throwsA(isA<Exception>()));
      },
    );

    test('should throw Exception when dio throws error', () async {
      // arrange
      when(() => platform.getApiKey()).thenReturn('1435v34r');
      when(
        () => platform.getBaseUrl(),
      ).thenReturn('https://financialdata.net/api/v1');

      when(() => dio.get(any())).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: ''),
          error: 'Erro de conexão',
        ),
      );

      // act
      final call = datasource.listStock;

      // assert
      expect(() => call(), throwsA(isA<Exception>()));
    });
  });
}
