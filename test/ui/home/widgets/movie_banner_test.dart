import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_app/domain/entites/movie.dart';
import 'package:the_movie_app/ui/home/widgets/movie_banner.dart';
import 'package:the_movie_app/ui/home/widgets/movie_preview.dart';

void main() {
  final movies = [
    Movie(
        id: 1,
        posterPath: '/poster1.jpg',
        title: 'Movie 1',
        year: '',
        rating: 0,
        overview: ''),
    Movie(
        id: 2,
        posterPath: '/poster2.jpg',
        title: 'Movie 2',
        year: '',
        rating: 0,
        overview: ''),
    Movie(
        id: 3,
        posterPath: '/poster3.jpg',
        title: 'Movie 3',
        year: '',
        rating: 0,
        overview: ''),
  ];

  testWidgets('MovieBanner displays the correct number of movies',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MovieBanner(movies: movies),
        ),
      ),
    );

    expect(find.byType(MoviePreview), findsOneWidget);
  });
}
