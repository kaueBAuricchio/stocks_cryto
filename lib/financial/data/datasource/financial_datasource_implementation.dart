import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stocks_cryto/financial/data/datasource/financial_datasource.dart';
import 'package:stocks_cryto/financial/data/model/stock_model.dart';

class FinancialDatasourceImplementation implements IFinancialDatasource {
  final Dio dio;
  final String apiKey = dotenv.env['API_KEY'] ?? '';
  final String baseUrl = dotenv.env['BASE_URL'] ?? '';

  FinancialDatasourceImplementation(this.dio);

  @override
  Future<List<StockModel>> listStock() async {
    try {
      final response = await dio.get('$baseUrl/stock-symbols?key=$apiKey');
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
