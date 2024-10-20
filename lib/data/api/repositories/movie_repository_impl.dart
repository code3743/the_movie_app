import 'package:the_movie_app/domain/datasources/movie_datasource.dart';
import 'package:the_movie_app/domain/entites/cast.dart';
import 'package:the_movie_app/domain/entites/genre.dart';
import 'package:the_movie_app/domain/entites/movie.dart';
import 'package:the_movie_app/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieDatasource _datasource;

  MovieRepositoryImpl(this._datasource);

  @override
  Future<List<Cast>> getCasts(int movieId) {
    return _datasource.getCasts(movieId);
  }

  @override
  Future<List<Movie>> getCoomingSoon(int page) {
    return _datasource.getCoomingSoon(page);
  }

  @override
  Future<List<Genre>> getGenres() {
    return _datasource.getGenres();
  }

  @override
  Future<List<Movie>> getMoviesbyGenre(int page, int genre) {
    return _datasource.getMoviesbyGenre(page, genre);
  }

  @override
  Future<List<Movie>> getNowPlaying() {
    return _datasource.getNowPlaying();
  }

  @override
  Future<List<Movie>> getSimilarMovies(int movieId) {
    return _datasource.getSimilarMovies(movieId);
  }

  @override
  Future<List<Movie>> searchMovies(String query) {
    return _datasource.searchMovies(query);
  }

  @override
  Future<Movie> getMovieDetail(int movieId) {
    return _datasource.getMovieDetail(movieId);
  }

  @override
  Future<List<Movie>> getPopularMovies(int page) {
    return _datasource.getPopularMovies(page);
  }
}
