import 'package:devnest/app/app_destination.dart';
import 'package:devnest/app/devnest_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Finds a destination by its label inside the navigation bar only, so a label
/// that also appears as a screen heading cannot make a finder ambiguous.
Finder navigationDestination(String label) {
  return find.descendant(
    of: find.byType(NavigationBar),
    matching: find.text(label),
  );
}

void main() {
  testWidgets('the shell has five destinations and a branded home screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const DevNestApp());

    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.byType(NavigationDestination), findsNWidgets(5));
    for (final AppDestination destination in AppDestination.values) {
      expect(
        navigationDestination(destination.label),
        findsOneWidget,
        reason: 'expected ${destination.label} in the navigation bar',
      );
    }

    expect(find.text('DevNest'), findsWidgets);
    expect(find.text('Your Development Server in Your Pocket'), findsOneWidget);
    expect(find.text('v0.1.0'), findsOneWidget);
  });

  testWidgets('tapping a destination selects it', (WidgetTester tester) async {
    await tester.pumpWidget(const DevNestApp());

    await tester.tap(
      find.byType(NavigationDestination).at(AppDestination.services.index),
    );
    await tester.pumpAndSettle();

    final NavigationBar navigationBar = tester.widget<NavigationBar>(
      find.byType(NavigationBar),
    );
    expect(navigationBar.selectedIndex, AppDestination.services.index);
  });

  testWidgets('the theme mode follows the setting on the Settings tab', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const DevNestApp());

    // The default is "follow the device".
    MaterialApp app = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(app.themeMode, ThemeMode.system);
    expect(app.darkTheme, isNotNull);

    await tester.tap(
      find.byType(NavigationDestination).at(AppDestination.settings.index),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Dark'));
    await tester.pumpAndSettle();

    app = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(app.themeMode, ThemeMode.dark);
  });

  testWidgets('the shell lays out on a small phone without overflowing', (
    WidgetTester tester,
  ) async {
    // 320 x 640 logical pixels: the narrowest device width DevNest supports.
    tester.view.physicalSize = const Size(960, 1920);
    tester.view.devicePixelRatio = 3.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const DevNestApp());
    await tester.pumpAndSettle();

    // A RenderFlex overflow is reported as an exception; a clean layout has none.
    expect(tester.takeException(), isNull);
  });
}
