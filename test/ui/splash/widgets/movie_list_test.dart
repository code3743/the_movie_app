import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_app/common/utils/format_image_url.dart';
import 'package:the_movie_app/ui/splash/widgets/movie_list.dart';

void main() {
  testWidgets('MoviesList displays the correct number of movie posters',
      (WidgetTester tester) async {
    const moviePosters = [
      '/movie_poster_1.jpg',
      '/movie_poster_2.jpg',
      '/movie_poster_3.jpg',
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(child: MoviesList(moviePosters: moviePosters)),
        ),
      ),
    );

    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('MoviesList loads images correctly', (WidgetTester tester) async {
    const moviePosters = [
      '/movie_poster_1.jpg',
      '/movie_poster_2.jpg',
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MoviesList(moviePosters: moviePosters),
        ),
      ),
    );

    expect(
        find.byWidgetPredicate((widget) =>
            widget is Image &&
            widget.image is NetworkImage &&
            (widget.image as NetworkImage).url ==
                formatImageUrl(moviePosters[0])),
        findsOneWidget);
  });
}
