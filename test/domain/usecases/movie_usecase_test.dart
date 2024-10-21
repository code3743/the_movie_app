import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_app/data/api/exceptions/api_exception.dart';
import 'package:the_movie_app/data/api/repositories/movie_repository_impl.dart';
import 'package:the_movie_app/domain/entites/movie.dart';
import 'package:the_movie_app/domain/usecases/movie_usecase.dart';

import '../../datasource/test_movie_datasource.dart';

void main() {
  group('MovieUseCase', () {
    late MovieUsecase movieUseCase;

    setUp(() {
      movieUseCase = MovieUsecase(MovieRepositoryImpl(TestMovieDatasource()));
    });

    test('should return list of movies when getPopularMovies is ', () async {
      final movies = await movieUseCase.getNowPlaying();

      expect(movies, isNotNull);
      expect(movies.length, greaterThan(0));
      expect(movies.first, isA<Movie>());
    });

    test('should return list of movies when getPopularMovies is called',
        () async {
      final movies = await movieUseCase.getPopularMovies(1);

      expect(movies, isNotNull);
      expect(movies.length, greaterThan(0));
      expect(movies.first, isA<Movie>());
    });

    test('should return list of movies when getPopularMovies is called',
        () async {
      final movies = await movieUseCase.getSimilarMovies(1);

      expect(movies, isNotNull);
      expect(movies.length, greaterThan(0));
      expect(movies.first, isA<Movie>());
    });

    test('should return list of movies when getCoomingSoon is called',
        () async {
      final movies = await movieUseCase.getCoomingSoon(1);

      expect(movies, isNotNull);
      expect(movies.length, greaterThan(0));
      expect(movies.first, isA<Movie>());
    });

    test('should return list of movies when getMoviesbyGenre is called',
        () async {
      final movies = await movieUseCase.getMoviesbyGenre(1, 1);

      expect(movies, isNotNull);
      expect(movies.length, greaterThan(0));
      expect(movies.first, isA<Movie>());
    });

    test(
        'should throw an exception when getMovieDetail is called with invalid id',
        () async {
      try {
        await movieUseCase.getMovieDetail(0);
      } catch (e) {
        expect(e, isA<ApiException>());
      }
    });

    test('should throw an exception', () async {
      try {
        await movieUseCase.getPopularMovies(0);
      } catch (e) {
        expect(e, isA<ApiException>());
      }
    });
  });
}
