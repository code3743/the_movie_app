import 'package:the_movie_app/domain/entites/genre.dart';

class Movie {
  final int id;
  final String title;
  final String year;
  final double rating;
  final String overview;
  final String posterPath;
  int runtime;
  List<Genre> genres;

  Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.rating,
    required this.overview,
    required this.posterPath,
    this.runtime = 0,
    this.genres = const [],
  });
}
