import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movie_app/config/router/app_router_name.dart';
import 'package:the_movie_app/domain/entites/movie.dart';
import 'package:the_movie_app/shared/providers/now_playing_provider.dart';
import 'package:the_movie_app/ui/home/widgets/movie_preview.dart';

class MovieBanner extends StatefulWidget {
  const MovieBanner({
    super.key,
    required this.movies,
  });

  final List<Movie> movies;

  @override
  State<MovieBanner> createState() => _MovieBannerState();
}

class _MovieBannerState extends State<MovieBanner> {
  final _pageController = PageController();
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < widget.movies.length) {
        _currentPage++;
      } else {
        _currentPage = 0;
        _pageController.jumpToPage(0);
        return;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 400,
      child: PageView.builder(
          controller: _pageController,
          itemCount: widget.movies.length + 1,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.push(AppRouterName.movieDetail,
                    extra: index == widget.movies.length
                        ? widget.movies[0]
                        : widget.movies[index]);
              },
              child: MoviePreview(
                poster: index == widget.movies.length
                    ? widget.movies[0].posterPath
                    : widget.movies[index].posterPath,
              ),
            );
          }),
    );
  }
}

class BannerCarousel extends ConsumerWidget {
  const BannerCarousel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
        future: ref.watch(nowPlayingProvider.future),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('An error occurred'),
            );
          }

          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return MovieBanner(movies: snapshot.data!);
        });
  }
}
