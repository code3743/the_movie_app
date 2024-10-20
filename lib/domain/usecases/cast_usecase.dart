import 'package:the_movie_app/domain/entites/cast.dart';
import 'package:the_movie_app/domain/repositories/movie_repository.dart';

class CastUsecase {
  final MovieRepository repository;

  CastUsecase(this.repository);

  Future<List<Cast>> getCasts(int movieId) async {
    return await repository.getCasts(movieId);
  }
}
