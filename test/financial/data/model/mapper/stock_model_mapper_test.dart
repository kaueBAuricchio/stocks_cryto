import 'package:flutter_test/flutter_test.dart';
import 'package:stocks_cryto/financial/data/model/mapper/stock_model_mapper.dart';
import 'package:stocks_cryto/financial/data/model/stock_model.dart';
import 'package:stocks_cryto/financial/domain/entity/stock_entity.dart';

void main() {
  group('StockModelMapper', () {
    test('toEntity must convert StockModel to StockEntity', () {
      // arrange
      const model = StockModel(symbol: 'A', name: 'AGILENT TECHNOLOGIES, INC.');
      // act
      final entity = model.toEntity();

      // assert
      expect(entity, isA<StockEntity>());
      expect(entity.symbol, 'A');
      expect(entity.name, 'AGILENT TECHNOLOGIES, INC.');
    });

    test(
      'toListEntity should convert list of StockModel to list of StockEntity',
      () {
        // arrange
        const models = [
          StockModel(symbol: 'A', name: 'AGILENT TECHNOLOGIES, INC.'),
          StockModel(symbol: 'AA', name: 'Alcoa Corp'),
        ];

        // act
        final entities = models.toListEntity();

        // assert
        expect(entities, isA<List<StockEntity>>());
        expect(entities.length, 2);
        expect(entities[0].symbol, 'A');
        expect(entities[1].name, 'Alcoa Corp');
      },
    );
  });
}
