import 'package:flutter/material.dart';
import 'package:the_movie_app/config/themes/app_colors.dart';
import 'package:the_movie_app/common/utils/format_image_url.dart';

class MoviePreview extends StatelessWidget {
  const MoviePreview({
    super.key,
    required this.poster,
  });
  final String poster;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(formatImageUrl(poster)),
              onError: (exception, stackTrace) => Icon(Icons.error),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(.8),
                BlendMode.darken,
              ),
            ),
          ),
          child: Image.network(formatImageUrl(poster),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.error)),
        ),
        Container(
          width: double.infinity,
          height: 400,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    AppColors.background,
                    Colors.transparent,
                    AppColors.background,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0, 0.5, 1])),
        ),
      ],
    );
  }
}
