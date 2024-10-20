import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie_app/config/providers/movie_repository_provider.dart';
import 'package:the_movie_app/domain/usecases/search_usecase.dart';

final searchUsecaseProvider = Provider<SearchUsecase>((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return SearchUsecase(repository);
});
