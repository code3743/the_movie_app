import 'package:flutter/material.dart';
import 'package:the_movie_app/config/themes/app_colors.dart';
import 'package:the_movie_app/common/widgets/custom_button.dart';
import 'package:the_movie_app/ui/details/widgets/expandable_text.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({
    super.key,
    required this.title,
    required this.genre,
    required this.year,
    required this.rating,
    required this.overview,
    required this.duration,
  });

  final String title;
  final String genre;
  final String year;
  final String rating;
  final String overview;
  final String duration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.titleLarge),
        SizedBox(
          height: 5,
        ),
        Text(genre,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyMedium),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text(year,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodySmall),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 50,
              height: 25,
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(rating,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.white)),
              ),
            )
          ],
        ),
        SizedBox(height: 5),
        Text(duration,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodySmall),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: CustomButton(text: 'Trailer', onPressed: () {}),
        ),
        Text('Overview',
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.titleMedium),
        SizedBox(
          height: 5,
        ),
        ExpandableText(text: overview),
      ],
    );
  }
}
