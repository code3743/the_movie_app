import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movie_app/config/router/app_router_name.dart';
import 'package:the_movie_app/shared/widgets/movie_tile.dart';

class MovieCollection extends StatelessWidget {
  const MovieCollection({
    super.key,
    required this.colelctionName,
  });

  final String colelctionName;

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
            child: Text(colelctionName,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.white)),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                    padding: index == 0
                        ? const EdgeInsets.only(
                            left: 20, top: 8, bottom: 8, right: 8)
                        : const EdgeInsets.all(8.0),
                    child: MovieTile(
                      title: 'Free Guy',
                      poster:
                          'https://cinexagerar.com/wp-content/uploads/2021/08/CATCHPHRASE_INTL_CHARACTER_BANNER_RYAN_LAS.jpg',
                      onTap: () {
                        context.push(AppRouterName.movieDetail);
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
