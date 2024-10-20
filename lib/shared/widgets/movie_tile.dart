import 'package:flutter/material.dart';

class MovieTile extends StatelessWidget {
  const MovieTile({
    super.key,
    required this.title,
    required this.poster,
    this.onTap,
  });

  final String title;
  final String poster;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
          width: 100,
          height: double.infinity,
          child: Column(children: [
            Expanded(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(poster, fit: BoxFit.cover),
            )),
            SizedBox(
                width: double.infinity,
                height: 30,
                child: Text(title,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(height: 1.1, fontWeight: FontWeight.w600)))
          ])),
    );
  }
}
