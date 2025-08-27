import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stocks_cryto/financial/domain/entity/stock_entity.dart';
import 'package:stocks_cryto/financial/presentation/view/widgets/financial_information_component.dart';

void main() {
  testWidgets('FinancialInformationComponent exibe symbol e name', (
    WidgetTester tester,
  ) async {
    // Arrange
    const stock = StockEntity(symbol: 'AAPL', name: 'Apple Inc');

    // Act
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: FinancialInformationComponent(stock: stock)),
      ),
    );

    // Assert
    expect(find.text('AAPL'), findsOneWidget);
    expect(find.text('Apple Inc'), findsOneWidget);

    // Verifica se o Card existe
    expect(find.byType(Card), findsOneWidget);

    // Verifica se o Divider existe
    expect(find.byType(Divider), findsOneWidget);
  });
}
