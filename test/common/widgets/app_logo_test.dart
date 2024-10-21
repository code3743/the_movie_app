import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_app/common/widgets/app_logo.dart';
import 'package:the_movie_app/config/themes/app_colors.dart';

void main() {
  testWidgets(
      'Given an AppLogo, When it is rendered, Then it should display the logo',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Expanded(child: AppLogo()),
              ],
            ),
          ),
        ),
      ),
    );

    expect(find.text('EMPLEAMOS'), findsOneWidget);
    expect(find.text('TEMPORALES'), findsOneWidget);

    final empleamosText = tester.widget<Text>(find.text('EMPLEAMOS'));
    expect(empleamosText.style?.color, AppColors.accent);
    expect(empleamosText.style?.fontSize, 20);
    expect(empleamosText.style?.fontWeight, FontWeight.bold);

    final temporalesText = tester.widget<Text>(find.text('TEMPORALES'));
    expect(temporalesText.style?.color, AppColors.primary);
    expect(temporalesText.style?.fontSize, 20);
    expect(temporalesText.style?.fontWeight, FontWeight.bold);
  });

  testWidgets(
      'Given an AppLogo with a scale, When it is rendered, Then it should display the logo with the specified scale',
      (WidgetTester tester) async {
    const scale = 2.0;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              Expanded(child: AppLogo(scale: scale)),
            ],
          ),
        ),
      ),
    );

    final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
    expect(sizedBox.width, 150 * scale);
    expect(sizedBox.height, 50 * scale);

    final empleamosText = tester.widget<Text>(find.text('EMPLEAMOS'));
    expect(empleamosText.style?.fontSize, 20 * scale);

    final temporalesText = tester.widget<Text>(find.text('TEMPORALES'));
    expect(temporalesText.style?.fontSize, 20 * scale);
  });
}
