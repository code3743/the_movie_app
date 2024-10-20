import 'package:the_movie_app/domain/entites/genre.dart';
import 'package:the_movie_app/domain/repositories/movie_repository.dart';

class GenreUsecase {
  final MovieRepository repository;

  GenreUsecase(this.repository);

  Future<List<Genre>> getGenres() async {
    return await repository.getGenres();
  }
}
