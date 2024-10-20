import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie_app/config/providers/movie_repository_provider.dart';
import 'package:the_movie_app/domain/usecases/genre_usecase.dart';

final genreUsecaseProvider = Provider<GenreUsecase>((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return GenreUsecase(repository);
});
