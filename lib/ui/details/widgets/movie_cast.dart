import 'package:flutter/material.dart';
import 'package:the_movie_app/config/themes/app_colors.dart';
import 'package:the_movie_app/domain/entites/cast.dart';
import 'package:the_movie_app/shared/utils/format_image_url.dart';

class MovieCast extends StatelessWidget {
  const MovieCast({
    super.key,
    required this.casts,
  });
  final List<Cast> casts;
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
          height: 175,
          child: ListView.builder(
              itemCount: casts.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: index == 0
                      ? const EdgeInsets.only(
                          left: 20, bottom: 8, right: 8, top: 8)
                      : const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 110,
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
                              formatImageUrl(casts[index].profileImage),
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(Icons.error),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(casts[index].name,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(height: 1)),
                        Text(casts[index].character,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
