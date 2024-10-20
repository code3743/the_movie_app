import 'package:flutter/material.dart';
import 'package:the_movie_app/shared/widgets/movie_tile.dart';
import 'package:the_movie_app/ui/home/widgets/list_category.dart';

class MovieGenreSection extends StatelessWidget {
  const MovieGenreSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 450,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text('Categories',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.white)),
          ),
          ListCategory(
            categories: List.generate(10, (index) => 'Category $index'),
            onTap: (index) {
              print('Selected index: $index');
            },
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                padding: EdgeInsets.only(left: 20),
                itemBuilder: (context, index) {
                  return MovieTile(
                    title: 'Free Guy',
                    poster:
                        'https://cinexagerar.com/wp-content/uploads/2021/08/CATCHPHRASE_INTL_CHARACTER_BANNER_RYAN_LAS.jpg',
                    onTap: () {},
                  );
                }),
          )
        ],
      ),
    );
  }
}
