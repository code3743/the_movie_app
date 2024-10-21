import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie_app/config/providers/movie_usecase_provider.dart';
import 'package:the_movie_app/domain/entites/movie.dart';

final moviesByCategoryProvider =
    StateNotifierProvider.family<MoviesNotifier, List<Movie>, int>(
        (ref, genre) {
  final movieUsecase = ref.watch(movieUseCaseProvider);
  return MoviesNotifier(movieUsecase.getMoviesbyGenre, genre);
});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  MoviesNotifier(this.getMovies, this._category) : super([]) {
    fecthMovie();
  }

  final Future<List<Movie>> Function(int page, int category) getMovies;

  int _page = 1;
  final int _category;
  bool _loading = false;

  void fecthMovie() async {
    try {
      if (_loading) return;
      _loading = true;
      final movies = await getMovies(_page, _category);
      state = [...state, ...movies];
      _page++;
      _loading = false;
    } catch (e) {
      rethrow;
    }
  }
}
