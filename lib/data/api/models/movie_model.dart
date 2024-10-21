import 'dart:convert';

import 'package:the_movie_app/data/api/models/genre_model.dart';
import 'package:the_movie_app/domain/entites/genre.dart';
import 'package:the_movie_app/domain/entites/movie.dart';

MovieResponse movieResponseFromJson(String str) =>
    MovieResponse.fromJson(json.decode(str));

DetailsResponse detailsFromJson(String str) =>
    DetailsResponse.fromJson(json.decode(str));

MovieModel movieFromJson(String str) => MovieModel.fromJson(json.decode(str));

class MovieResponse {
  int page;
  List<MovieModel> results;
  int totalPages;
  int totalResults;

  MovieResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) => MovieResponse(
        page: json["page"],
        results: List<MovieModel>.from(
            json["results"].map((x) => MovieModel.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  List<Movie> toEntity() {
    return results.map((e) => e.toEntity()).toList();
  }
}

class DetailsResponse {
  List<GenreModel> genres;

  int runtime;

  DetailsResponse({
    required this.genres,
    required this.runtime,
  });

  factory DetailsResponse.fromJson(Map<String, dynamic> json) =>
      DetailsResponse(
        genres: List<GenreModel>.from(
            json["genres"].map((x) => GenreModel.fromJson(x))),
        runtime: json["runtime"] ?? 0,
      );

  List<Genre> genresToEntity() {
    return genres.map((e) => e.toEntity()).toList();
  }

  int runtimeToEntity() {
    return runtime;
  }
}

class MovieModel {
  int id;
  String overview;
  String posterPath;
  DateTime? releaseDate;
  String title;
  bool video;
  double voteAverage;
  int runtime;

  MovieModel({
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.runtime,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json["id"],
        overview: json["overview"],
        posterPath: json["poster_path"] ?? "",
        releaseDate: DateTime.tryParse(json["release_date"] ?? ''),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        runtime: json["runtime"] ?? 0,
      );

  Movie toEntity([int runtime = 0, List<Genre> genres = const []]) {
    return Movie(
      id: id,
      title: title,
      year: releaseDate?.year.toString() ?? '',
      rating: voteAverage,
      overview: overview,
      posterPath: posterPath,
      runtime: runtime,
      genres: genres,
    );
  }
}
