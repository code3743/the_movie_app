import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie_app/config/router/app_router_name.dart';
import 'package:the_movie_app/common/utils/format_image_url.dart';
import 'package:the_movie_app/ui/home/providers/movie_search_provider.dart';

class MovieSearchDelegate extends SearchDelegate {
  MovieSearchDelegate({required this.onSearch});

  final void Function(String query) onSearch;

  @override
  List<Widget>? buildActions(BuildContext context) {
    if (query.isEmpty) {
      return [
        renderCloseIconButton(Icons.cancel),
      ];
    }
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: Icon(Icons.search)),
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return renderCloseIconButton(Icons.arrow_back);
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return Center(child: Text('Enter a movie name to search'));
    }

    onSearch(query);
    return renderMoviesList(Text('No results found'));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Center(child: Text('Enter a movie name to search'));
    }
    onSearch(query);
    return renderMoviesList(Text('No suggestions found'));
  }

  Widget renderCloseIconButton(IconData icon) {
    return Consumer(builder: (context, ref, _) {
      return IconButton(
          onPressed: () {
            ref.read(movieSearchProvider.notifier).clearSearch();
            close(context, null);
          },
          icon: Icon(icon));
    });
  }

  Widget renderMoviesList([Widget? emptyMovie]) {
    return Consumer(builder: (context, ref, _) {
      final movies = ref.watch(movieSearchProvider);

      if (movies.isEmpty && emptyMovie != null) {
        return Center(child: emptyMovie);
      }

      return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                context.push(AppRouterName.movieDetail, extra: movies[index]);
              },
              leading: Image.network(formatImageUrl(movies[index].posterPath),
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.error)),
              title: Text(movies[index].title),
              trailing: Icon(Icons.arrow_forward_ios),
            );
          });
    });
  }
}
