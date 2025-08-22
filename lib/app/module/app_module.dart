import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:stocks_cryto/financial/data/datasource/financial_datasource_implementation.dart';
import 'package:stocks_cryto/financial/domain/repository/financial_repository_implementation.dart';
import 'package:stocks_cryto/financial/presentation/cubit/financial_cubit.dart';
import 'package:stocks_cryto/financial/presentation/view/financial_list_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => Dio()),
    Bind((i) => FinancialDatasourceImplementation(i.get())),
    Bind((i) => FinancialRepositoryImplementation(i.get())),
    Bind((i) => FinancialCubit(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => const FinancialListPage()),
  ];
}
