import 'package:business_os/src/app/business_os_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('launch flow creates a coffee store preview', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1200, 900));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const BusinessOsApp());

    expect(find.text('เลือกประเภทร้าน'), findsOneWidget);
    expect(find.text('ร้านกาแฟ'), findsOneWidget);
    expect(find.text('ร้านกาแฟ (เริ่มต้น)'), findsOneWidget);
    expect(find.text('เปิดร้านได้ภายใน 5 นาที'), findsOneWidget);

    await tester.tap(find.text('สร้างตัวอย่างร้าน'));
    await tester.pumpAndSettle();

    expect(find.text('พร้อมขาย'), findsOneWidget);
    expect(find.text('เอสเปรสโซ'), findsWidgets);
    expect(find.text('฿45'), findsWidgets);
  });

  testWidgets('category selection refreshes available templates', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(1200, 900));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const BusinessOsApp());

    await tester.tap(find.text('ร้านผลไม้'));
    await tester.pumpAndSettle();

    expect(find.text('ร้านผลไม้ (เริ่มต้น)'), findsOneWidget);
    expect(find.text('แตงโม'), findsOneWidget);

    await tester.tap(find.text('สร้างตัวอย่างร้าน'));
    await tester.pumpAndSettle();

    expect(find.text('แตงโม'), findsWidgets);
  });
}
