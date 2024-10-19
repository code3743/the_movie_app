import 'package:flutter/material.dart';

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
                  child: GestureDetector(
                    onTap: () {
                      print('Selected index: $index');
                    },
                    child: SizedBox(
                        width: 100,
                        height: double.infinity,
                        child: Column(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  'https://cinexagerar.com/wp-content/uploads/2021/08/CATCHPHRASE_INTL_CHARACTER_BANNER_RYAN_LAS.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                                width: double.infinity,
                                height: 30,
                                child: Text(
                                  'Movie $index' * 5,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          height: 1.1,
                                          fontWeight: FontWeight.w600),
                                )),
                          ],
                        )),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
