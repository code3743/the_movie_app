import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie_app/data/api/datasources/themoviedb_datasource.dart';
import 'package:the_movie_app/data/api/repositories/movie_repository_impl.dart';
import 'package:the_movie_app/domain/repositories/movie_repository.dart';

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final datasource = ThemoviedbDatasource();
  return MovieRepositoryImpl(datasource);
});
