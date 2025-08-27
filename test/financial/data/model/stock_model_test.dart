import 'package:flutter_test/flutter_test.dart';
import 'package:stocks_cryto/financial/data/model/stock_model.dart';

void main() {
  group('StockModel', () {
    test('fromJson should create instance correctly', () {
      // arrange
      final json = {'trading_symbol': 'AAPL', 'registrant_name': 'Apple Inc'};

      // act
      final model = StockModel.fromJson(json);

      // assert
      expect(model.symbol, 'AAPL');
      expect(model.name, 'Apple Inc');
    });

    test('fromJson should assign default values ​​when fields are missing', () {
      // arrange
      final json = <String, dynamic>{};

      // act
      final model = StockModel.fromJson(json);

      // assert
      expect(model.symbol, '');
      expect(model.name, '');
    });

    test('fromListMap should convert list of maps to list of StockModel', () {
      // arrange
      final jsonList = [
        {'trading_symbol': 'GOOG', 'registrant_name': 'Google'},
        {'trading_symbol': 'MSFT', 'registrant_name': 'Microsoft'},
      ];

      // act
      final models = StockModel.fromListMap(jsonList);

      // assert
      expect(models, isA<List<StockModel>>());
      expect(models.length, 2);
      expect(models[0].symbol, 'GOOG');
      expect(models[1].name, 'Microsoft');
    });

    test('equal StockModels should be considered equivalent', () {
      // arrange
      const stock1 = StockModel(symbol: 'TSLA', name: 'Tesla');
      const stock2 = StockModel(symbol: 'TSLA', name: 'Tesla');

      // assert
      expect(stock1, equals(stock2));
      expect(stock1.props, stock2.props);
    });
  });
}
