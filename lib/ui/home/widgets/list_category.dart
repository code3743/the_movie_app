import 'package:flutter/material.dart';
import 'package:the_movie_app/ui/home/widgets/text_category.dart';

class ListCategory extends StatelessWidget {
  const ListCategory({
    super.key,
    required this.categories,
    required this.onTap,
  });
  final List<String> categories;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> selectedCategory = ValueNotifier(0);

    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ValueListenableBuilder(
                  valueListenable: selectedCategory,
                  builder: (context, value, _) {
                    return TextCategory(
                      isSelected: value == index,
                      onTap: () {
                        selectedCategory.value = index;
                        onTap(index);
                      },
                      title: categories[index],
                    );
                  }),
            );
          }),
    );
  }
}
