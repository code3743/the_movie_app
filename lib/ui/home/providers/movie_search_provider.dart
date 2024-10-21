import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie_app/domain/entites/movie.dart';
import 'package:the_movie_app/domain/usecases/search_usecase.dart';
import 'package:the_movie_app/config/providers/search_usecase_provider.dart';

final movieSearchProvider =
    StateNotifierProvider<MovieSearchNotifier, List<Movie>>((ref) {
  final movieSearchUseCase = ref.watch(searchUsecaseProvider);
  return MovieSearchNotifier(movieSearchUseCase);
});

class MovieSearchNotifier extends StateNotifier<List<Movie>> {
  MovieSearchNotifier(this._movieSearchUseCase) : super([]);
  final SearchUsecase _movieSearchUseCase;

  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void searchMovie(String query) async {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 700), () {
      _searchMovie(query);
    });
  }

  void _searchMovie(String query) async {
    try {
      if (query.isEmpty) {
        return;
      }
      final movies = await _movieSearchUseCase.searchMovies(query);
      state = movies;
    } catch (e) {
      rethrow;
    }
  }

  void clearSearch() {
    state = [];
  }
}
