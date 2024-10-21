import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie_app/ui/home/delegate/movie_search_delegate.dart';
import 'package:the_movie_app/ui/home/providers/get_movies_provider.dart';
import 'package:the_movie_app/common/widgets/widgets.dart';
import 'package:the_movie_app/ui/home/providers/movie_search_provider.dart';
import 'package:the_movie_app/ui/home/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  BannerCarousel(),
                  CustomAppBar(),
                ],
              ),
              Consumer(builder: (context, ref, _) {
                return MovieCollection(
                  colelctionName: 'Popular Movies',
                  movies: ref.watch(popularMoviesProvider),
                  onMore: ref.read(popularMoviesProvider.notifier).fecthMovie,
                );
              }),
              Consumer(builder: (context, ref, _) {
                return MovieCollection(
                  colelctionName: 'Coming Soon',
                  movies: ref.watch(commingSoonProvider),
                  onMore: ref.read(commingSoonProvider.notifier).fecthMovie,
                );
              }),
              MovieGenreSection(),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Consumer(builder: (context, ref, _) {
        return BottomNavigationBar(
          onTap: (value) {
            if (value == 1) {
              showSearch(
                  context: context,
                  delegate: MovieSearchDelegate(
                      onSearch:
                          ref.read(movieSearchProvider.notifier).searchMovie));
              return;
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded),
              label: 'Search',
            ),
          ],
        );
      }),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppLogo(
            scale: 0.7,
          ),
          Consumer(builder: (context, ref, _) {
            return IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: MovieSearchDelegate(
                        onSearch: ref
                            .read(movieSearchProvider.notifier)
                            .searchMovie));
              },
            );
          }),
        ],
      ),
    );
  }
}
