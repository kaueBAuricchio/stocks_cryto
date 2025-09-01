import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stocks_cryto/financial/domain/entity/stock_entity.dart';
import 'package:stocks_cryto/financial/presentation/view/widgets/financial_information_component.dart';

void main() {
  testWidgets('FinancialInformationComponent displays symbol and name', (
    WidgetTester tester,
  ) async {
    // Arrange
    const stock = StockEntity(symbol: 'AA', name: 'Alcoa Corp');

    // Act
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: FinancialInformationComponent(stock: stock)),
      ),
    );

    // Assert
    expect(find.text('AA'), findsOneWidget);
    expect(find.text('Alcoa Corp'), findsOneWidget);

    expect(find.byType(Card), findsOneWidget);

    expect(find.byType(Divider), findsOneWidget);
  });
}
