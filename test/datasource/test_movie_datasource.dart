import 'package:the_movie_app/data/api/exceptions/api_exception.dart';
import 'package:the_movie_app/domain/datasources/movie_datasource.dart';
import 'package:the_movie_app/domain/entites/cast.dart';
import 'package:the_movie_app/domain/entites/genre.dart';
import 'package:the_movie_app/domain/entites/movie.dart';

class TestMovieDatasource implements MovieDatasource {
  @override
  Future<List<Cast>> getCasts(int movieId) async {
    if (movieId == 0) {
      throw ApiException('Failed to load casts');
    }

    return List.generate(10,
        (i) => Cast(id: '${i + 1}', name: '', character: '', profileImage: ''));
  }

  @override
  Future<List<Movie>> getCoomingSoon(int page) async {
    if (page == 0) {
      throw ApiException('Failed to load movies');
    }

    return List.generate(
        10,
        (i) => Movie(
            id: i + 1,
            title: '',
            year: '',
            rating: 0,
            overview: '',
            posterPath: ''));
  }

  @override
  Future<List<Genre>> getGenres() async {
    return List.generate(10, (i) => Genre(id: i + 1, name: ''));
  }

  @override
  Future<Movie> getMovieDetail(int movieId) async {
    if (movieId == 0) {
      throw ApiException('Failed to load movie detail');
    }

    return Movie(
        id: 1, title: '', year: '', rating: 0, overview: '', posterPath: '');
  }

  @override
  Future<List<Movie>> getMoviesbyGenre(int page, int genre) async {
    if (page == 0 || genre == 0) {
      throw ApiException('Failed to load movies');
    }

    return List.generate(
        10,
        (i) => Movie(
            id: i + 1,
            title: '',
            year: '',
            rating: 0,
            overview: '',
            posterPath: ''));
  }

  @override
  Future<List<Movie>> getNowPlaying() async {
    return List.generate(
        10,
        (i) => Movie(
            id: i + 1,
            title: '',
            year: '',
            rating: 0,
            overview: '',
            posterPath: ''));
  }

  @override
  Future<List<Movie>> getPopularMovies(int page) async {
    if (page == 0) {
      throw ApiException('Failed to load movies');
    }

    return List.generate(
        10,
        (i) => Movie(
            id: i + 1,
            title: '',
            year: '',
            rating: 0,
            overview: '',
            posterPath: ''));
  }

  @override
  Future<List<Movie>> getSimilarMovies(int movieId) async {
    if (movieId == 0) {
      throw ApiException('Failed to load movies');
    }

    return List.generate(
        10,
        (i) => Movie(
            id: i + 1,
            title: '',
            year: '',
            rating: 0,
            overview: '',
            posterPath: ''));
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    if (query.isEmpty) {
      throw ApiException('Failed to load movies');
    }

    return List.generate(
        10,
        (i) => Movie(
            id: i + 1,
            title: '',
            year: '',
            rating: 0,
            overview: '',
            posterPath: ''));
  }
}
