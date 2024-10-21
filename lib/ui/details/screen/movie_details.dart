import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movie_app/config/themes/app_colors.dart';
import 'package:the_movie_app/domain/entites/movie.dart';
import 'package:the_movie_app/shared/widgets/movie_collection.dart';
import 'package:the_movie_app/ui/details/providers/movie_details_provider.dart';
import 'package:the_movie_app/ui/details/widgets/widgets.dart';

class MovieDetails extends ConsumerWidget {
  const MovieDetails({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieProvider = ref.watch(movieDetailsProvider(movie));
    final notifier = ref.read(movieDetailsProvider(movie).notifier);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                MoviePoster(
                  poster: movieProvider.posterPath,
                ),
                Positioned(
                    left: 20,
                    top: 30,
                    child: IconButton(
                        style: IconButton.styleFrom(
                            backgroundColor:
                                AppColors.secondary.withOpacity(.7)),
                        onPressed: () => context.pop(),
                        icon: Icon(Icons.arrow_back))),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: MovieDetail(
                title: movieProvider.title,
                genre: movieProvider.genres.map((e) => e.name).join(', '),
                year: movieProvider.year,
                rating: movieProvider.rating.toStringAsFixed(2),
                overview: movieProvider.overview,
                duration: movieProvider.runtime == 0
                    ? 'N/A'
                    : '${movieProvider.runtime} min',
              ),
            ),
            FutureBuilder(
                future: notifier.getCast(),
                builder: (context, snapshot) {
                  return MovieCast(
                    casts: snapshot.data ?? [],
                  );
                }),
            FutureBuilder(
                future: notifier.getSimilarMovies(),
                builder: (context, snapshot) {
                  return MovieCollection(
                    colelctionName: 'Similar Movies',
                    movies: snapshot.data ?? [],
                  );
                }),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
