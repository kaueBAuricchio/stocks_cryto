import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stocks_cryto/core/state/cubit_state.dart';
import 'package:stocks_cryto/financial/domain/entity/stock_entity.dart';
import 'package:stocks_cryto/financial/presentation/cubit/financial_cubit.dart';
import 'package:stocks_cryto/financial/presentation/view/financial_list_page.dart';
import 'package:stocks_cryto/financial/presentation/view/widgets/financial_information_component.dart';
import 'package:stocks_cryto/financial/presentation/view/widgets/financial_shimmer.dart';

// Mock do cubit
class MockFinancialCubit extends MockCubit<CubitState>
    implements FinancialCubit {}

void main() {
  late MockFinancialCubit mockCubit;

  setUp(() {
    mockCubit = MockFinancialCubit();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(home: FinancialListPage(cubit: mockCubit));
  }

  testWidgets('displays shimmer when state is LoadingCubitState', (
    tester,
  ) async {
    when(() => mockCubit.listStocks()).thenAnswer((_) async {});
    whenListen(
      mockCubit,
      Stream.value(LoadingCubitState()),
      initialState: LoadingCubitState(),
    );

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump(); // processa o Stream

    expect(find.byType(FinancialShimmer), findsOneWidget);
  });

  testWidgets('display list when state is SuccessCubitState', (tester) async {
    final stocks = [
      const StockEntity(symbol: 'A', name: 'AGILENT TECHNOLOGIES, INC.'),
      const StockEntity(symbol: 'AA', name: 'Alcoa Corp'),
    ];

    when(() => mockCubit.listStocks()).thenAnswer((_) async {});
    whenListen(
      mockCubit,
      Stream.value(SuccessCubitState(value: stocks)),
      initialState: SuccessCubitState(value: stocks),
    );

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    expect(find.byType(FinancialInformationComponent), findsNWidgets(2));
    expect(find.text('AGILENT TECHNOLOGIES, INC.'), findsOneWidget);
    expect(find.text('Alcoa Corp'), findsOneWidget);
  });

  testWidgets('display error message when state is ErrorCubitState', (
    tester,
  ) async {
    when(() => mockCubit.listStocks()).thenAnswer((_) async {});
    whenListen(
      mockCubit,
      Stream.value(ErrorCubitState(message: 'Error loading')),
      initialState: ErrorCubitState(message: 'Error loading'),
    );

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    expect(find.text('Error loading'), findsOneWidget);
  });
}
