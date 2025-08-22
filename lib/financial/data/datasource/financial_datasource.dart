import 'package:stocks_cryto/financial/data/model/stock_model.dart';

abstract class IFinancialDatasource {
  Future<List<StockModel>> listStock();
}
