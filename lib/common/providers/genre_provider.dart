import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie_app/config/providers/genre_usecase_provider.dart';
import 'package:the_movie_app/domain/entites/genre.dart';

final genreProvider = FutureProvider<List<Genre>>((ref) async {
  final genreUseCase = ref.read(genreUsecaseProvider);
  return await genreUseCase.getGenres();
});
