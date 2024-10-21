import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie_app/config/providers/movie_usecase_provider.dart';
import 'package:the_movie_app/domain/entites/cast.dart';
import 'package:the_movie_app/domain/entites/movie.dart';
import 'package:the_movie_app/domain/usecases/movie_usecase.dart';

final movieDetailsProvider = StateNotifierProvider.family
    .autoDispose<MovieDetailsNotifier, Movie, Movie>((ref, movie) {
  final movieUsecase = ref.watch(movieUseCaseProvider);
  return MovieDetailsNotifier(movie, movieUsecase);
});

class MovieDetailsNotifier extends StateNotifier<Movie> {
  MovieDetailsNotifier(super.state, this._movieUsecase) {
    init();
  }
  final MovieUsecase _movieUsecase;

  void init() async {
    try {
      state = await _movieUsecase.getMovieDetail(state.id);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Movie>> getSimilarMovies() async {
    return await _movieUsecase.getSimilarMovies(state.id);
  }

  Future<List<Cast>> getCast() async {
    return await _movieUsecase.getCasts(state.id);
  }
}
