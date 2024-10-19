import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movie_app/config/themes/app_colors.dart';
import 'package:the_movie_app/shared/widgets/movie_collection.dart';
import 'package:the_movie_app/ui/details/widgets/widgets.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                MoviePoster(),
                Positioned(
                    left: 20,
                    top: 30,
                    child: IconButton(
                        style: IconButton.styleFrom(
                            backgroundColor:
                                AppColors.secondary.withOpacity(.7)),
                        onPressed: () {
                          context.pop();
                        },
                        icon: Icon(Icons.arrow_back))),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: MovieDetail(
                  title: 'Naruto Shippuden',
                  genre: 'Action, Adventure, Fantasy',
                  year: '2021',
                  rating: '4.5',
                  overview:
                      'Naruto Shippuden is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, a young ninja who seeks recognition from his peers and dreams of becoming the Hokage, the leader of his village.'),
            ),
            MovieCast(),
            MovieCollection(colelctionName: 'Related Movies'),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
