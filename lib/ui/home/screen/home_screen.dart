import 'package:flutter/material.dart';
import 'package:the_movie_app/shared/widgets/app_logo.dart';
import 'package:the_movie_app/ui/home/widgets/widgets.dart';
import 'package:the_movie_app/shared/widgets/movie_collection.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  MovieBanner(),
                  CustomAppBar(),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: MovieCollection(
                colelctionName: 'Popular Movies',
              ),
            ),
            SliverToBoxAdapter(
              child: MovieCollection(
                colelctionName: 'Commings Soon',
              ),
            ),
            SliverToBoxAdapter(
              child: ListCategory(
                categories: List.generate(10, (index) => 'Category $index'),
                onTap: (index) {
                  print('Selected index: $index');
                },
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Container(
                        color:
                            Colors.primaries[index % Colors.primaries.length],
                        child: Center(
                          child: Text('Item $index'),
                        ),
                      );
                    },
                    childCount: 10,
                  )),
            )
          ],
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
