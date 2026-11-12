import 'package:facebook_app/main.dart';
import 'package:facebook_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Login shows errors for invalid credentials', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.enterText(find.byKey(const Key('email')), 'not-an-email');
    await tester.enterText(find.byKey(const Key('password')), '123');
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    expect(find.text('Enter a valid email address'), findsOneWidget);
    expect(
      find.text('Password must have at least 8 characters'),
      findsOneWidget,
    );
    expect(find.byType(HomePage), findsNothing);
  });

  testWidgets('Password visibility can be toggled', (tester) async {
    await tester.pumpWidget(const MyApp());
    final passwordField = find.descendant(
      of: find.byKey(const Key('password')),
      matching: find.byType(TextField),
    );
    expect(tester.widget<TextField>(passwordField).obscureText, isTrue);

    await tester.tap(find.byTooltip('Show password'));
    await tester.pump();
    expect(tester.widget<TextField>(passwordField).obscureText, isFalse);
  });

  testWidgets('Login opens a scrolling home feed', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.enterText(
      find.byKey(const Key('email')),
      'student@example.com',
    );
    await tester.enterText(find.byKey(const Key('password')), '12345678');
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    expect(find.byType(HomePage), findsOneWidget);
    expect(find.text('Create a\nstory'), findsOneWidget);
    expect(find.byType(Tab), findsNWidgets(6));
    await tester.drag(find.byType(ListView).first, const Offset(0, -400));
    await tester.pumpAndSettle();
    expect(find.text('Route'), findsWidgets);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Login works on a small phone with the keyboard open', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 568);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetViewInsets);
    await tester.pumpWidget(const MyApp());
    tester.view.viewInsets = const FakeViewPadding(bottom: 250);
    await tester.pump();

    await tester.enterText(
      find.byKey(const Key('email')),
      'student@example.com',
    );
    await tester.enterText(find.byKey(const Key('password')), '12345678');
    await tester.ensureVisible(find.text('Login'));
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();
    expect(find.byType(HomePage), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
