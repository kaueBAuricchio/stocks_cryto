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

  testWidgets('exibe shimmer quando estado é LoadingCubitState', (
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

  testWidgets('exibe lista quando estado é SuccessCubitState', (tester) async {
    final stocks = [
      const StockEntity(symbol: 'AAPL', name: 'Apple Inc'),
      const StockEntity(symbol: 'GOOG', name: 'Google'),
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
    expect(find.text('Apple Inc'), findsOneWidget);
    expect(find.text('Google'), findsOneWidget);
  });

  testWidgets('exibe mensagem de erro quando estado é ErrorCubitState', (
    tester,
  ) async {
    when(() => mockCubit.listStocks()).thenAnswer((_) async {});
    whenListen(
      mockCubit,
      Stream.value(ErrorCubitState(message: 'Erro ao carregar')),
      initialState: ErrorCubitState(message: 'Erro ao carregar'),
    );

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    expect(find.text('Erro ao carregar'), findsOneWidget);
  });
}
