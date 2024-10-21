import 'package:the_movie_app/domain/entites/cast.dart';
import 'package:the_movie_app/domain/entites/movie.dart';
import 'package:the_movie_app/domain/repositories/movie_repository.dart';

class MovieUsecase {
  final MovieRepository repository;

  MovieUsecase(this.repository);

  Future<List<Movie>> getMoviesbyGenre(int page, int genre) async {
    return await repository.getMoviesbyGenre(page, genre);
  }

  Future<List<Movie>> getNowPlaying() async {
    return await repository.getNowPlaying();
  }

  Future<List<Movie>> getCoomingSoon(int page) async {
    return await repository.getCoomingSoon(page);
  }

  Future<List<Movie>> getSimilarMovies(int movieId) async {
    return await repository.getSimilarMovies(movieId);
  }

  Future<Movie> getMovieDetail(int movieId) async {
    return await repository.getMovieDetail(movieId);
  }

  Future<List<Movie>> getPopularMovies(int page) async {
    return await repository.getPopularMovies(page);
  }

  Future<List<Cast>> getCasts(int movieId) async {
    return await repository.getCasts(movieId);
  }
}
