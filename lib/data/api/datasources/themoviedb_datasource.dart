import 'package:http/http.dart' as http;
import 'package:the_movie_app/data/api/exceptions/api_exception.dart';
import 'package:the_movie_app/domain/entites/cast.dart';
import 'package:the_movie_app/domain/entites/genre.dart';
import 'package:the_movie_app/domain/entites/movie.dart';
import 'package:the_movie_app/data/api/models/movie_model.dart';
import 'package:the_movie_app/data/api/models/casting_model.dart';
import 'package:the_movie_app/config/constants/api_themoviedb.dart';
import 'package:the_movie_app/domain/datasources/movie_datasource.dart';

class ThemoviedbDatasource implements MovieDatasource {
  final Map<String, String> headers = {
    'Authorization': 'Bearer ${ApiThemoviedb.apiKey}',
    'accept': 'application/json',
  };

  Future<List<Movie>> fetchMovieList(String path, int page,
      [Map<String, String>? querys]) async {
    try {
      final url = Uri.https(ApiThemoviedb.baseUrl, path, {
        'language': ApiThemoviedb.language,
        'page': page.toString(),
        ...?querys
      });
      final response = await http.get(url, headers: headers);

      if (response.statusCode != 200) {
        throw ApiException('Failed to load movies');
      }
      return movieResponseFromJson(response.body).toEntity();
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      } else {
        throw ApiException('An error occurred: $e');
      }
    }
  }

  @override
  Future<List<Cast>> getCasts(int movieId) async {
    try {
      final url = Uri.https(
          ApiThemoviedb.baseUrl,
          '${ApiThemoviedb.movie}/$movieId/${ApiThemoviedb.credits}',
          {'language': ApiThemoviedb.language});
      final response = await http.get(url, headers: headers);
      if (response.statusCode != 200) {
        throw ApiException('Failed to load casts');
      }

      return castingModelFromJson(response.body).toEntity();
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      } else {
        throw ApiException('An error occurred: $e');
      }
    }
  }

  @override
  Future<List<Movie>> getCoomingSoon(int page) async {
    try {
      return await fetchMovieList(ApiThemoviedb.upcoming, page);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Genre>> getGenres() async {
    try {
      final url = Uri.https(ApiThemoviedb.baseUrl, ApiThemoviedb.genre);
      final response = await http.get(url, headers: headers);

      if (response.statusCode != 200) {
        throw ApiException('Failed to load genres');
      }

      return detailsFromJson(response.body).genresToEntity();
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      } else {
        throw ApiException('An error occurred: $e');
      }
    }
  }

  @override
  Future<List<Movie>> getMoviesbyGenre(int page, int genre) async {
    try {
      return await fetchMovieList(
          ApiThemoviedb.discover, page, {'with_genres': genre.toString()});
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Movie>> getNowPlaying() {
    try {
      return fetchMovieList(ApiThemoviedb.nowPlaying, 1);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Movie>> getSimilarMovies(int movieId) async {
    try {
      return await fetchMovieList(
          '${ApiThemoviedb.movie}/$movieId/${ApiThemoviedb.similar}', 1);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    try {
      return await fetchMovieList(ApiThemoviedb.search, 1, {'query': query});
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Movie> getMovieDetail(int movieId) async {
    try {
      final url = Uri.https(
          ApiThemoviedb.baseUrl,
          '${ApiThemoviedb.movie}/$movieId',
          {'language': ApiThemoviedb.language});

      final response = await http.get(url, headers: headers);

      if (response.statusCode != 200) {
        throw ApiException('Failed to load movie');
      }
      final details = detailsFromJson(response.body);

      final movie = movieFromJson(response.body)
          .toEntity(details.runtimeToEntity(), details.genresToEntity());

      return movie;
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      } else {
        throw ApiException('An error occurred: $e');
      }
    }
  }

  @override
  Future<List<Movie>> getPopularMovies(int page) {
    try {
      return fetchMovieList(ApiThemoviedb.popular, page);
    } catch (e) {
      rethrow;
    }
  }
}
