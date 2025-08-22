import 'package:dartz/dartz.dart';
import 'package:stocks_cryto/core/error/failure.dart';
import 'package:stocks_cryto/financial/data/datasource/financial_datasource.dart';
import 'package:stocks_cryto/financial/data/model/mapper/stock_model_mapper.dart';
import 'package:stocks_cryto/financial/domain/entity/stock_entity.dart';
import 'package:stocks_cryto/financial/domain/repository/financial_repository.dart';

class FinancialRepositoryImplementation implements IFinancialRepository {
  final IFinancialDatasource datasource;
  FinancialRepositoryImplementation(this.datasource);

  @override
  Future<Either<Failure, List<StockEntity>>> listStock() async {
    try {
      final result = await datasource.listStock();
      return Right(result.toListEntity());
    } on DataPostFailure catch (e) {
      return Left(e);
    } on Exception {
      return Left(ServerFailure());
    }
  }
}
