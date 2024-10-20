import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie_app/config/providers/movie_repository_provider.dart';
import 'package:the_movie_app/domain/usecases/movie_usecase.dart';

final movieUseCaseProvider = Provider<MovieUsecase>((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return MovieUsecase(repository);
});
