import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_app/common/widgets/movie_collection.dart';
import 'package:the_movie_app/domain/entites/movie.dart';

void main() {
  final movies = [
    Movie(
      id: 1,
      title: 'The Matrix Reloaded',
      posterPath: '/plYYSxZ9Wdq4thyVSkhJjbjYtVG.jpg',
      year: '',
      rating: 0,
      overview: '',
    ),
    Movie(
      id: 2,
      title: 'The Matrix',
      posterPath: '/plYYSxZ9Wdq4thyVSkhJjbjYtVG.jpg',
      year: '',
      rating: 0,
      overview: '',
    ),
  ];

  testWidgets(
      'Given a MovieCollection, When it is rendered, Then it should display the collection name',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MovieCollection(
            colelctionName: 'Popular Movies',
            movies: movies,
          ),
        ),
      ),
    );

    expect(find.text('Popular Movies'), findsOneWidget);

    expect(find.text('The Matrix Reloaded'), findsOneWidget);
  });

  testWidgets(
      'Given a MovieCollection, When it is rendered, Then it should display the movies',
      (WidgetTester tester) async {
    var onMoreCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MovieCollection(
            colelctionName: 'Popular Movies',
            movies: List.generate(
                10,
                (index) => Movie(
                    id: index + 1,
                    title: 'Movie $index',
                    posterPath: '/plYYSxZ9Wdq4thyVSkhJjbjYtVG.jpg',
                    year: '',
                    rating: 0,
                    overview: '')),
            onMore: () {
              onMoreCalled = true;
            },
          ),
        ),
      ),
    );

    await tester.drag(find.byType(ListView), const Offset(-1000, 0));
    await tester.pumpAndSettle();

    expect(onMoreCalled, isTrue);
  });

  testWidgets(
      'Given a MovieCollection, When it is rendered, Then it should display a loading indicator',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MovieCollection(
            colelctionName: 'Popular Movies',
            movies: [],
          ),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
