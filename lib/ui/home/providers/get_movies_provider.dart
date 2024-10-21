import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie_app/config/providers/movie_usecase_provider.dart';
import 'package:the_movie_app/domain/entites/movie.dart';

final popularMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final movieUsecase = ref.watch(movieUseCaseProvider);
  return MoviesNotifier(movieUsecase.getPopularMovies);
});

final commingSoonProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final movieUsecase = ref.watch(movieUseCaseProvider);
  return MoviesNotifier(movieUsecase.getCoomingSoon);
});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  MoviesNotifier(this.getMovies) : super([]) {
    fecthMovie();
  }
  final Future<List<Movie>> Function(int page) getMovies;

  int _page = 1;
  bool _loading = false;

  void fecthMovie() async {
    try {
      if (_loading) return;
      _loading = true;
      final movies = await getMovies(_page);
      state = [...state, ...movies];
      _page++;
      _loading = false;
    } catch (e) {
      rethrow;
    }
  }
}
