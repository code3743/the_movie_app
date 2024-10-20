import 'package:the_movie_app/domain/entites/movie.dart';
import 'package:the_movie_app/domain/repositories/movie_repository.dart';

class SearchUsecase {
  final MovieRepository repository;

  SearchUsecase(this.repository);

  Future<List<Movie>> searchMovies(String query) async {
    return await repository.searchMovies(query);
  }
}
