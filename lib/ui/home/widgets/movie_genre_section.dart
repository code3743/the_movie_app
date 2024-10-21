import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie_app/domain/entites/movie.dart';
import 'package:the_movie_app/common/widgets/movie_tile.dart';
import 'package:the_movie_app/config/router/app_router_name.dart';
import 'package:the_movie_app/ui/home/widgets/list_category.dart';
import 'package:the_movie_app/common/utils/format_image_url.dart';
import 'package:the_movie_app/common/providers/genre_provider.dart';
import 'package:the_movie_app/ui/home/providers/movies_by_category_provider.dart';

class MovieGenreSection extends StatelessWidget {
  const MovieGenreSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int?> currentGenre = ValueNotifier(null);

    return SizedBox(
      width: double.infinity,
      height: 450,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text('Categories',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.white)),
          ),
          Consumer(builder: (context, ref, _) {
            final genre = ref.watch(genreProvider).valueOrNull;
            if (genre == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            currentGenre.value = genre.first.id;
            return ListCategory(
              categories: genre.map((e) => e.name).toList(),
              onTap: (index) {
                currentGenre.value = genre[index].id;
              },
            );
          }),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ValueListenableBuilder(
                valueListenable: currentGenre,
                builder: (context, value, _) {
                  if (value == null) return SizedBox();
                  return Consumer(builder: (context, ref, _) {
                    final movies = ref.watch(moviesByCategoryProvider(value));
                    final notifier =
                        ref.read(moviesByCategoryProvider(value).notifier);
                    return MovieGenreList(
                        movies: movies, onMore: notifier.fecthMovie);
                  });
                }),
          )
        ],
      ),
    );
  }
}

class MovieGenreList extends StatefulWidget {
  const MovieGenreList({
    super.key,
    required this.onMore,
    required this.movies,
  });

  final void Function() onMore;
  final List<Movie> movies;

  @override
  State<MovieGenreList> createState() => _MovieGenreListState();
}

class _MovieGenreListState extends State<MovieGenreList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent - 600) {
        widget.onMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: widget.movies.length,
        padding: EdgeInsets.only(left: 20),
        itemBuilder: (context, index) {
          return MovieTile(
            title: widget.movies[index].title,
            poster: formatImageUrl(widget.movies[index].posterPath),
            onTap: () {
              context.push(AppRouterName.movieDetail,
                  extra: widget.movies[index]);
            },
          );
        });
  }
}
