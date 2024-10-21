import 'package:flutter/material.dart';
import 'package:the_movie_app/config/themes/app_colors.dart';
import 'package:the_movie_app/common/utils/format_image_url.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({
    super.key,
    required this.poster,
  });

  final String poster;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.network(
          formatImageUrl(poster),
          width: double.infinity,
          errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
          height: 445,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    AppColors.background,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0, 1])),
        ),
      ],
    );
  }
}
