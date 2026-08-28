// Test file for anniversary gift app

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:anniversary_gift/main.dart';

void main() {
  testWidgets('Anniversary app launches successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const AnniversaryGiftApp());

    // Verify that the welcome screen shows
    expect(find.text('Years of Love'), findsOneWidget);
    expect(find.text('Begin Our Story'), findsOneWidget);
  });
}
