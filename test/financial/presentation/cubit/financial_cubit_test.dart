import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stocks_cryto/core/error/failure.dart';
import 'package:stocks_cryto/financial/data/datasource/financial_datasource.dart';
import 'package:stocks_cryto/financial/data/model/stock_model.dart';
import 'package:stocks_cryto/financial/domain/entity/stock_entity.dart';
import 'package:stocks_cryto/financial/domain/repository/financial_repository_implementation.dart';

// Mock do datasource
class MockFinancialDatasource extends Mock implements IFinancialDatasource {}

void main() {
  late FinancialRepositoryImplementation repository;
  late MockFinancialDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockFinancialDatasource();
    repository = FinancialRepositoryImplementation(mockDatasource);
  });

  group('FinancialRepositoryImplementation.listStock', () {
    test('should return Right when datasource returns success', () async {
      // Arrange
      final models = [
        const StockModel(symbol: 'A', name: 'AGILENT TECHNOLOGIES, INC.'),
        const StockModel(symbol: 'AA', name: 'Alcoa Corp'),
      ];

      when(() => mockDatasource.listStock()).thenAnswer((_) async => models);

      // Act
      final result = await repository.listStock();

      // Assert
      expect(result.isRight(), true);
      result.fold((_) => fail('Shouldnt fail'), (entities) {
        expect(entities, isA<List<StockEntity>>());
        expect(entities.length, 2);
        expect(entities.first.symbol, 'A');
      });

      // Verifica se o datasource foi chamado 1x
      verify(() => mockDatasource.listStock()).called(1);
    });

    test('should return Left when datasource throws DataPostFailure', () async {
      // Arrange
      when(() => mockDatasource.listStock()).thenThrow(DataPostFailure());

      // Act
      final result = await repository.listStock();

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) => expect(failure, isA<DataPostFailure>()),
        (_) => fail('Should fail'),
      );

      verify(() => mockDatasource.listStock()).called(1);
    });

    test(
      'should return Left when datasource throws generic Exception',
      () async {
        // Arrange
        when(
          () => mockDatasource.listStock(),
        ).thenThrow(Exception('Generic error'));

        // Act
        final result = await repository.listStock();

        // Assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<ServerFailure>()),
          (_) => fail('Should fail'),
        );

        verify(() => mockDatasource.listStock()).called(1);
      },
    );
  });
}
