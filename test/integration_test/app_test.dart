import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:stocks_cryto/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Real API Integration', () {
    testWidgets('should load list of actions and display real names', (
      tester,
    ) async {
      app.main();
      await tester.pumpAndSettle();

      expect(find.text('No data available'), findsNothing);

      await tester.pumpAndSettle(const Duration(seconds: 5));

      expect(find.byType(Card), findsWidgets);

      expect(find.text('A'), findsOneWidget);
      expect(find.text('AA'), findsOneWidget);

      expect(find.text('AGILENT TECHNOLOGIES, INC.'), findsOneWidget);
      expect(find.text('Alcoa Corp'), findsOneWidget);
    });
  });
}
