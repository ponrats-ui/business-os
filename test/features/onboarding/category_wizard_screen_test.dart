import 'package:business_os/src/app/business_os_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('launch flow creates a coffee store preview', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1200, 900));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const BusinessOsApp());

    expect(find.text('Choose Business Category'), findsOneWidget);
    expect(find.text('Coffee Shop'), findsOneWidget);
    expect(find.text('Coffee Starter'), findsOneWidget);

    await tester.tap(find.text('Create Store Preview'));
    await tester.pumpAndSettle();

    expect(find.text('Ready to sell'), findsOneWidget);
    expect(find.text('Espresso'), findsOneWidget);
    expect(find.text('THB 45'), findsOneWidget);
  });

  testWidgets('category selection refreshes available templates', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(1200, 900));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const BusinessOsApp());

    await tester.tap(find.widgetWithText(ChoiceChip, 'Fruit Shop'));
    await tester.pumpAndSettle();

    expect(find.text('Fresh Fruit Stand'), findsOneWidget);
    expect(find.text('Watermelon'), findsNothing);

    await tester.tap(find.text('Create Store Preview'));
    await tester.pumpAndSettle();

    expect(find.text('Watermelon'), findsOneWidget);
  });
}
