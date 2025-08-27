import 'package:flutter_test/flutter_test.dart';
import 'package:stocks_cryto/financial/domain/entity/stock_entity.dart';

void main() {
  group('StockEntity', () {
    test('must create an instance with correct values', () {
      const entity = StockEntity(symbol: 'AAPL', name: 'Apple Inc');
      expect(entity.symbol, 'AAPL');
      expect(entity.name, 'Apple Inc');
    });

    test('two instances with the same values ​​must be equal', () {
      const entity1 = StockEntity(symbol: 'AAPL', name: 'Apple Inc');
      const entity2 = StockEntity(symbol: 'AAPL', name: 'Apple Inc');

      expect(entity1, equals(entity2));
    });

    test('two instances with different values ​​must not be equal', () {
      const entity1 = StockEntity(symbol: 'AAPL', name: 'Apple Inc');
      const entity2 = StockEntity(symbol: 'GOOG', name: 'Google');

      expect(entity1, isNot(equals(entity2)));
    });

    test('props must contain symbol and name', () {
      const entity = StockEntity(symbol: 'AAPL', name: 'Apple Inc');
      expect(entity.props, ['AAPL', 'Apple Inc']);
    });
  });
}
