import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie_app/domain/usecases/cast_usecase.dart';
import 'package:the_movie_app/config/providers/movie_repository_provider.dart';

final castUsecaseProvider = Provider<CastUsecase>((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return CastUsecase(repository);
});
