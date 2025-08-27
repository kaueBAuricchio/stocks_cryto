import 'package:dio/dio.dart';
import 'package:stocks_cryto/core/platform/platform_methods_implementation.dart';
import 'package:stocks_cryto/financial/data/datasource/financial_datasource.dart';
import 'package:stocks_cryto/financial/data/model/stock_model.dart';

class FinancialDatasourceImplementation implements IFinancialDatasource {
  final Dio dio;
  final PlatformMethods platformMethods;

  FinancialDatasourceImplementation(this.dio, this.platformMethods);

  @override
  Future<List<StockModel>> listStock() async {
    try {
      final response = await dio.get(
        '${platformMethods.getBaseUrl()}/stock-symbols?key=${platformMethods.getApiKey()}',
      );
      if (response.statusCode == 200) {
        return StockModel.fromListMap(response.data);
      } else {
        throw Exception('Failed to load stocks');
      }
    } catch (e) {
      throw Exception('Error fetching stock data: $e');
    }
  }
}
