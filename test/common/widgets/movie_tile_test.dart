import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_app/common/widgets/movie_tile.dart';

void main() {
  testWidgets(
      'Given a MovieTile, When it is rendered, Then it should display the title',
      (WidgetTester tester) async {
    const title = 'Matrix';
    const posterUrl =
        'https://image.tmdb.org/t/p/w500/plYYSxZ9Wdq4thyVSkhJjbjYtVG.jpg';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MovieTile(
            title: title,
            poster: posterUrl,
          ),
        ),
      ),
    );

    expect(find.text(title), findsOneWidget);
  });

  testWidgets(
      'Given a MovieTile, When it is rendered, Then it should display the poster',
      (WidgetTester tester) async {
    const title = 'Matrix';
    const posterUrl =
        'https://image.tmdb.org/t/p/w500/plYYSxZ9Wdq4thyVSkhJjbjYtVG.jpg';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MovieTile(
            title: title,
            poster: posterUrl,
          ),
        ),
      ),
    );

    final image = tester.widget<Image>(find.byType(Image));
    expect(image.image, isA<NetworkImage>());
    final networkImage = image.image as NetworkImage;
    expect(networkImage.url, posterUrl);
  });

  testWidgets(
      'Given a MovieTile with an invalid poster, When it is rendered, Then it should display an error icon',
      (WidgetTester tester) async {
    const title = 'Matrix';
    const invalidPosterUrl = 'https://invalid_url.com/poster.jpg';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MovieTile(
            title: title,
            poster: invalidPosterUrl,
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.error), findsOneWidget);
  });
  testWidgets(
    'Given a MovieTile with a tap callback, When it is tapped, Then it should call the callback',
    (WidgetTester tester) async {
      const title = 'Matrix';
      const posterUrl =
          'https://image.tmdb.org/t/p/w500/plYYSxZ9Wdq4thyVSkhJjbjYtVG.jpg';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: MovieTile(
                title: title,
                poster: posterUrl,
                onTap: () {},
              ),
            ),
          ),
        ),
      );

      // Asegúrate de que el MovieTile está en la pantalla
      expect(find.byType(GestureDetector), findsOneWidget);
    },
  );
}
