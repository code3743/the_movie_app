import 'package:the_movie_app/domain/entites/cast.dart';
import 'package:the_movie_app/domain/entites/genre.dart';
import 'package:the_movie_app/domain/entites/movie.dart';

abstract class MovieDatasource {
  Future<List<Movie>> getMoviesbyGenre(int page, int genre);
  Future<List<Movie>> searchMovies(String query);
  Future<List<Genre>> getGenres();
  Future<List<Movie>> getNowPlaying();
  Future<List<Movie>> getCoomingSoon(int page);
  Future<List<Movie>> getPopularMovies(int page);
  Future<List<Movie>> getSimilarMovies(int movieId);
  Future<List<Cast>> getCasts(int movieId);
  Future<Movie> getMovieDetail(int movieId);
}
