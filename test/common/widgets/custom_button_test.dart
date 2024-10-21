import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_app/common/widgets/custom_button.dart';

void main() {
  testWidgets(
      'Given a CustomButton, When it is rendered, Then it should display the text',
      (WidgetTester tester) async {
    const buttonText = 'Click me';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomButton(
            text: buttonText,
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.text(buttonText), findsOneWidget);
  });

  testWidgets(
      'Given a CustomButton, When it is rendered, Then it should display a FilledButton',
      (WidgetTester tester) async {
    var pressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomButton(
            text: 'Click me',
            onPressed: () {
              pressed = true;
            },
          ),
        ),
      ),
    );

    expect(find.byType(FilledButton), findsOneWidget);
    await tester.tap(find.byType(FilledButton));
    await tester.pump();

    expect(pressed, true);
  });

  testWidgets(
      'Given a CustomButton, When it is rendered with a width, Then it should have the specified width',
      (WidgetTester tester) async {
    const buttonWidth = 200.0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomButton(
            text: 'Click me',
            onPressed: () {},
            width: buttonWidth,
          ),
        ),
      ),
    );

    final SizedBox buttonSizedBox = tester.widget(find.byType(SizedBox));
    expect(buttonSizedBox.width, buttonWidth);
  });
}
