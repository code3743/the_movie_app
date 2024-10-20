import 'package:the_movie_app/domain/repositories/movie_repository.dart';

class MovieUsecase {
  final MovieRepository repository;

  MovieUsecase(this.repository);

  Future getMoviesbyGenre(int page, int genre) async {
    return await repository.getMoviesbyGenre(page, genre);
  }

  Future getNowPlaying() async {
    return await repository.getNowPlaying();
  }

  Future getCoomingSoon(int page) async {
    return await repository.getCoomingSoon(page);
  }

  Future getSimilarMovies(int movieId) async {
    return await repository.getSimilarMovies(movieId);
  }

  Future getMovieDetail(int movieId) async {
    return await repository.getMovieDetail(movieId);
  }

  Future getPopularMovies(int page) async {
    return await repository.getPopularMovies(page);
  }
}
