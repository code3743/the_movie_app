import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie_app/ui/home/providers/get_movies_provider.dart';
import 'package:the_movie_app/shared/widgets/widgets.dart';
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
                  MovieBanner(),
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
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => print('Selected index: $value'),
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
      ),
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
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('Search button pressed');
            },
          ),
        ],
      ),
    );
  }
}
