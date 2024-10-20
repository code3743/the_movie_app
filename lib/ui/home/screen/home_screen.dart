import 'package:flutter/material.dart';
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
              MovieCollection(
                colelctionName: 'Popular Movies',
              ),
              MovieCollection(
                colelctionName: 'Coming Soon',
              ),
              MovieGenreSection(),
              SizedBox(
                height: 60,
              )
            ],
          ),
        ),
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
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              print('Menu button pressed');
            },
          ),
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
