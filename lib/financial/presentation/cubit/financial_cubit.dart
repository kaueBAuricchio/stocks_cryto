import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_cryto/core/state/cubit_state.dart';
import 'package:stocks_cryto/financial/domain/repository/financial_repository.dart';

class FinancialCubit extends Cubit<CubitState> {
  final IFinancialRepository _repository;

  FinancialCubit(this._repository) : super(CubitState.empty());

  Future<void> listStocks() async {
    emit(CubitState.loading());
    try {
      final result = await _repository.listStock();
      final state = result.fold(
        (failure) => CubitState.error(message: 'Falha ao carregar a lista'),
        (stocks) => CubitState.success(value: stocks),
      );
      emit(state);
    } catch (e) {
      emit(CubitState.error(message: 'An unexpected error occurred'));
    }
  }
}
