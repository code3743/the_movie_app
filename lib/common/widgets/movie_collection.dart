import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movie_app/config/router/app_router_name.dart';
import 'package:the_movie_app/domain/entites/movie.dart';
import 'package:the_movie_app/common/utils/format_image_url.dart';
import 'package:the_movie_app/common/widgets/movie_tile.dart';

class MovieCollection extends StatefulWidget {
  const MovieCollection({
    super.key,
    required this.colelctionName,
    required this.movies,
    this.onMore,
  });

  final String colelctionName;
  final void Function()? onMore;

  final List<Movie> movies;

  @override
  State<MovieCollection> createState() => _MovieCollectionState();
}

class _MovieCollectionState extends State<MovieCollection> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent - 600) {
        widget.onMore?.call();
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
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(widget.colelctionName,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.white)),
          ),
          widget.movies.isEmpty
              ? Expanded(
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.movies.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: index == 0
                              ? const EdgeInsets.only(
                                  left: 20, top: 8, bottom: 8, right: 8)
                              : const EdgeInsets.all(8.0),
                          child: MovieTile(
                            title: widget.movies[index].title,
                            poster:
                                formatImageUrl(widget.movies[index].posterPath),
                            onTap: () {
                              context.push(AppRouterName.movieDetail,
                                  extra: widget.movies[index]);
                            },
                          ));
                    },
                  ),
                )
        ],
      ),
    );
  }
}
