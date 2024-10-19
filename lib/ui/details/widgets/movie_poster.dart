import 'package:flutter/material.dart';
import 'package:the_movie_app/config/themes/app_colors.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.network(
          'https://www.yourdecoration.es/cdn/shop/products/abystyle-abydco254-naruto-shippuden-shippuden-group-nr-2-poster-38x52cm_500x.jpg?v=1709734998',
          width: double.infinity,
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
