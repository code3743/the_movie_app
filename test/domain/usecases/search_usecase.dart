import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_app/data/api/exceptions/api_exception.dart';
import 'package:the_movie_app/data/api/repositories/movie_repository_impl.dart';
import 'package:the_movie_app/domain/entites/movie.dart';
import 'package:the_movie_app/domain/usecases/search_usecase.dart';

import '../../datasource/test_movie_datasource.dart';

void main() {
  group('SearchUseCase', () {
    late SearchUsecase searchUseCase;

    setUp(() {
      searchUseCase = SearchUsecase(MovieRepositoryImpl(TestMovieDatasource()));
    });

    test('should return list of movies when searchMovies is called', () async {
      final movies = await searchUseCase.searchMovies('Batman');

      expect(movies, isNotNull);
      expect(movies.length, greaterThan(0));
      expect(movies.first, isA<Movie>());
    });

    test('should return list of movies when searchMovies is called', () async {
      try {
        await searchUseCase.searchMovies('');
      } catch (e) {
        expect(e, isA<ApiException>());
      }
    });
  });
}
