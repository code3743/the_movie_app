import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_app/data/api/repositories/movie_repository_impl.dart';
import 'package:the_movie_app/domain/entites/genre.dart';
import 'package:the_movie_app/domain/usecases/genre_usecase.dart';

import '../../datasource/test_movie_datasource.dart';

void main() {
  group('GenreUseCase', () {
    late GenreUsecase genreUseCase;

    setUp(() {
      genreUseCase = GenreUsecase(MovieRepositoryImpl(TestMovieDatasource()));
    });

    test('should return list of genres when getGenres is called', () async {
      final genres = await genreUseCase.getGenres();
      expect(genres, isNotNull);
      expect(genres.length, greaterThan(0));
      expect(genres.first, isA<Genre>());
    });
  });
}
