import 'package:dartz/dartz.dart';
import 'package:stocks_cryto/core/error/failure.dart';
import 'package:stocks_cryto/financial/domain/entity/stock_entity.dart';

abstract class IFinancialRepository {
  Future<Either<Failure, List<StockEntity>>> listStock();
}
