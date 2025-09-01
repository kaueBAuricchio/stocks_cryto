import 'package:flutter_test/flutter_test.dart';
import 'package:stocks_cryto/financial/data/model/stock_model.dart';

void main() {
  group('StockModel', () {
    test('fromJson should create instance correctly', () {
      // arrange
      final json = {
        'trading_symbol': 'A',
        'registrant_name': 'AGILENT TECHNOLOGIES, INC.',
      };

      // act
      final model = StockModel.fromJson(json);

      // assert
      expect(model.symbol, 'A');
      expect(model.name, 'AGILENT TECHNOLOGIES, INC.');
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
        {
          'trading_symbol': 'A',
          'registrant_name': 'AGILENT TECHNOLOGIES, INC.',
        },
        {'trading_symbol': 'AA', 'registrant_name': 'Alcoa Corp'},
      ];

      // act
      final models = StockModel.fromListMap(jsonList);

      // assert
      expect(models, isA<List<StockModel>>());
      expect(models.length, 2);
      expect(models[0].symbol, 'A');
      expect(models[1].name, 'Alcoa Corp');
    });

    test('equal StockModels should be considered equivalent', () {
      // arrange
      const stock1 = StockModel(
        symbol: 'A',
        name: 'AGILENT TECHNOLOGIES, INC.',
      );
      const stock2 = StockModel(
        symbol: 'A',
        name: 'AGILENT TECHNOLOGIES, INC.',
      );

      // assert
      expect(stock1, equals(stock2));
      expect(stock1.props, stock2.props);
    });
  });
}
