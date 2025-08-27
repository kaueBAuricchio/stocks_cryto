import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:stocks_cryto/core/state/cubit_state.dart';
import 'package:stocks_cryto/financial/presentation/cubit/financial_cubit.dart';
import 'package:stocks_cryto/financial/presentation/view/widgets/financial_information_component.dart';
import 'package:stocks_cryto/financial/presentation/view/widgets/financial_shimmer.dart';

class FinancialListPage extends StatefulWidget {
  final FinancialCubit? cubit;
  const FinancialListPage({this.cubit, super.key});

  @override
  State<FinancialListPage> createState() => _FinancialListPageState();
}

class _FinancialListPageState extends State<FinancialListPage> {
  late final FinancialCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = widget.cubit ?? Modular.get<FinancialCubit>();
    cubit.listStocks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<FinancialCubit, CubitState>(
        bloc: cubit,
        builder: (context, state) {
          if (state is LoadingCubitState) {
            return FinancialShimmer();
          } else if (state is SuccessCubitState) {
            final stocks = state.value;
            return ListView.builder(
              itemCount: stocks.length,
              itemBuilder: (context, index) {
                final stock = stocks[index];
                return FinancialInformationComponent(stock: stock);
              },
            );
          } else if (state is ErrorCubitState) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('No data available'));
        },
      ),
    );
  }
}
