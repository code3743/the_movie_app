import 'package:flutter/material.dart';
import 'package:the_movie_app/config/themes/app_colors.dart';

class MovieCast extends StatelessWidget {
  const MovieCast({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text('Cast',
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.titleMedium),
        ),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          width: double.infinity,
          height: 150,
          child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: index == 0
                      ? const EdgeInsets.only(
                          left: 20, bottom: 8, right: 8, top: 8)
                      : const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.accent,
                            width: 2,
                          ),
                        ),
                        child: ClipOval(
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                            'https://www.yourdecoration.es/cdn/shop/products/abystyle-abydco254-naruto-shippuden-shippuden-group-nr-2-poster-38x52cm_500x.jpg?v=1709734998',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text('Actor $index',
                          maxLines: 2,
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}
