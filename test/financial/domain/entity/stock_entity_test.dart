import 'package:flutter_test/flutter_test.dart';
import 'package:stocks_cryto/financial/domain/entity/stock_entity.dart';

void main() {
  group('StockEntity', () {
    test('must create an instance with correct values', () {
      const entity = StockEntity(
        symbol: 'A',
        name: 'AGILENT TECHNOLOGIES, INC.',
      );
      expect(entity.symbol, 'A');
      expect(entity.name, 'AGILENT TECHNOLOGIES, INC.');
    });

    test('two instances with the same values ​​must be equal', () {
      const entity1 = StockEntity(
        symbol: 'A',
        name: 'AGILENT TECHNOLOGIES, INC.',
      );
      const entity2 = StockEntity(
        symbol: 'A',
        name: 'AGILENT TECHNOLOGIES, INC.',
      );

      expect(entity1, equals(entity2));
    });

    test('two instances with different values ​​must not be equal', () {
      const entity1 = StockEntity(
        symbol: 'A',
        name: 'AGILENT TECHNOLOGIES, INC.',
      );
      const entity2 = StockEntity(symbol: 'AA', name: 'Alcoa Corp');

      expect(entity1, isNot(equals(entity2)));
    });

    test('props must contain symbol and name', () {
      const entity = StockEntity(
        symbol: 'A',
        name: 'AGILENT TECHNOLOGIES, INC.',
      );
      expect(entity.props, ['A', 'AGILENT TECHNOLOGIES, INC.']);
    });
  });
}
