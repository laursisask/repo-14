// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import 'package:zeta_flutter_template/main.dart';

void main() {
  testWidgets('App runs', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
  });

  testWidgets('Bottom navigation bar works on small screen', (WidgetTester tester) async {
    // Set the screen size to a small value
    tester.view.devicePixelRatio = 1.0;
    tester.view.physicalSize = const Size(481, 480);

    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Find the bottom navigation bar widget
    final bottomNavigationBarFinder = find.byType(ZetaNavigationBar);

    // Verify that the bottom navigation bar is present
    expect(bottomNavigationBarFinder, findsOneWidget);

    // Perform a tap on the first item of the bottom navigation bar
    await tester.tap(find.byIcon(ZetaIcons.content_round));
    await tester.pump();

    // Verify that the first item is selected
    expect(bottomNavigationBarFinder, findsOneWidget);
    expect(tester.widget<ZetaNavigationBar>(bottomNavigationBarFinder).currentIndex, 0);

    // Perform a tap on the second item of the bottom navigation bar
    await tester.tap(find.byIcon(ZetaIcons.star_round));
    await tester.pump();

    // // Verify that the second item is selected
    expect(bottomNavigationBarFinder, findsOneWidget);
    expect(tester.widget<ZetaNavigationBar>(bottomNavigationBarFinder).currentIndex, 1);
  });

  testWidgets('Side navigation bar works on large screen', (WidgetTester tester) async {
    // Set the screen size to a small value
    tester.view.devicePixelRatio = 1.0;
    tester.view.physicalSize = const Size(881, 480);

    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Find the bottom navigation bar widget
    final navigationRailFinder = find.byType(ZetaNavigationRail);

    // Verify that the bottom navigation bar is present
    expect(navigationRailFinder, findsOneWidget);

    // Perform a tap on the first item of the bottom navigation bar
    await tester.tap(find.byIcon(ZetaIcons.content));
    await tester.pump();

    // Verify that the first item is selected
    expect(navigationRailFinder, findsOneWidget);
    expect(tester.widget<ZetaNavigationRail>(navigationRailFinder).selectedIndex, 0);

    // Perform a tap on the second item of the bottom navigation bar
    await tester.tap(find.byIcon(ZetaIcons.star));
    await tester.pump();

    // // Verify that the second item is selected
    expect(navigationRailFinder, findsOneWidget);
    expect(tester.widget<ZetaNavigationRail>(navigationRailFinder).selectedIndex, 1);
  });

  testWidgets('Switching between light and dark mode', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Find the switch widget
    final switchFinder = find.byType(ZetaSwitch).first;

    // Verify that the switch is present
    // expect(switchFinder, findsOneWidget);

    // Get the current brightness mode
    final zetaFinder = find.byType(Zeta);
    final initialBrightness = tester.widget<Zeta>(zetaFinder).brightness;
    // final brightnessMode = tester.binding.window.platformBrightness;

    // Perform a tap on the switch to toggle the brightness mode
    await tester.tap(switchFinder);
    await tester.pump();

    // Verify that the brightness mode has changed
    expect(tester.widget<Zeta>(zetaFinder).brightness, isNot(initialBrightness));

    // Perform another tap on the switch to toggle back to the original brightness mode
    await tester.tap(switchFinder);
    await tester.pump();

    // Verify that the brightness mode has changed back to the original mode
    expect(tester.widget<Zeta>(zetaFinder).brightness, initialBrightness);
  });
}
