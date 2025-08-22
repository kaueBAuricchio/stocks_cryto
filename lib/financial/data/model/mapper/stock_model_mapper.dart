import 'package:stocks_cryto/financial/data/model/stock_model.dart';
import 'package:stocks_cryto/financial/domain/entity/stock_entity.dart';

extension StockModelMapper on StockModel {
  StockEntity toEntity() => StockEntity(symbol: symbol, name: name);
}

extension ListPokemonModelMapper on List<StockModel> {
  List<StockEntity> toListEntity() => map((model) => model.toEntity()).toList();
}
