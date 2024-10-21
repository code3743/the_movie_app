import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie_app/config/providers/movie_usecase_provider.dart';
import 'package:the_movie_app/domain/entites/movie.dart';

final nowPlayingProvider = FutureProvider<List<Movie>>((ref) async {
  final movieUseCase = ref.read(movieUseCaseProvider);
  return await movieUseCase.getNowPlaying();
});
