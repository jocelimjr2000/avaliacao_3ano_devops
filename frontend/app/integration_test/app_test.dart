import 'package:cadusuario_frontend/app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Testes de funcionalidades', () {
    testWidgets('Teste de scroll', (tester) async {
      await tester.pumpWidget(const MyApp());

      final listFinder = find.byType(ListView);

      await tester.fling(listFinder, const Offset(0, -500), 10000);
      await tester.pumpAndSettle();

      await tester.fling(listFinder, const Offset(0, 500), 10000);
      await tester.pumpAndSettle();
    });
    testWidgets('Teste', (tester) async {
      await tester.pumpWidget(const MyApp());

      final iconKeys = [
        'icon_0',
        'icon_1',
        'icon_2',
        'icon_3',
      ];

      for (var icon in iconKeys) {
        await tester.tap(find.byKey(ValueKey(icon)));
        await tester.pumpAndSettle(const Duration(seconds: 1));

        expect(find.text('Adicionado aos favoritos.'), findsOneWidget);
      }

      await tester.tap(find.text('Favoritos'));
      await tester.pumpAndSettle();

      final removeIconKeys = [
        'remover_icon_0',
        'remover_icon_1',
        'remover_icon_2',
        'remover_icon_3',
      ];

      for (final iconKey in removeIconKeys) {
        await tester.tap(find.byKey(ValueKey(iconKey)));
        await tester.pumpAndSettle(const Duration(seconds: 1));

        expect(find.text('Removido dos favoritos.'), findsOneWidget);
      }
    });
  });
}
