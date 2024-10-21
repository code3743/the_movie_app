import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_app/ui/home/widgets/list_category.dart'; // Asegúrate de tener la ruta correcta
import 'package:the_movie_app/ui/home/widgets/text_category.dart'; // Ruta al widget TextCategory

void main() {
  testWidgets('ListCategory displays the correct number of categories',
      (WidgetTester tester) async {
    const categories = ['Action', 'Comedy', 'Drama'];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListCategory(
            categories: categories,
            onTap: (index) {},
          ),
        ),
      ),
    );

    expect(find.byType(TextCategory), findsNWidgets(categories.length));
  });

  testWidgets('ListCategory calls onTap when a category is tapped',
      (WidgetTester tester) async {
    const categories = ['Action', 'Comedy', 'Drama'];
    int selectedIndex = -1;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListCategory(
            categories: categories,
            onTap: (index) {
              selectedIndex = index;
            },
          ),
        ),
      ),
    );

    expect(selectedIndex, -1);

    await tester.tap(find.byType(TextCategory).first);
    await tester.pumpAndSettle();

    expect(selectedIndex, 0);

    await tester.tap(find.byType(TextCategory).at(1));
    await tester.pumpAndSettle();

    expect(selectedIndex, 1);
  });

  testWidgets('ListCategory highlights the selected category',
      (WidgetTester tester) async {
    const categories = ['Action', 'Comedy', 'Drama'];
    int selectedIndex = -1;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListCategory(
            categories: categories,
            onTap: (index) {
              selectedIndex = index;
            },
          ),
        ),
      ),
    );

    await tester.tap(find.byType(TextCategory).first);
    await tester.pumpAndSettle();

    expect(selectedIndex == 0, isTrue);

    await tester.tap(find.byType(TextCategory).at(1));
    await tester.pumpAndSettle();

    expect(selectedIndex == 1, isTrue);
    expect(selectedIndex == 0, isFalse);
  });
}
