import 'package:flutter/material.dart';

class TextCategory extends StatelessWidget {
  const TextCategory(
      {super.key,
      required this.isSelected,
      required this.index,
      required this.onTap});
  final bool isSelected;
  final int index;
  final ValueChanged<int> onTap;

  TextStyle getTextStyle(bool isSelected, BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return isSelected
        ? textTheme.bodyLarge!.copyWith(
            color: Colors.white,
          )
        : textTheme.bodyLarge!;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          onTap(index);
        },
        child: SizedBox(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isSelected)
                TweenAnimationBuilder(
                    tween: Tween(
                      begin: 0.0,
                      end: 1.0,
                    ),
                    duration: Duration(microseconds: 100),
                    builder: (context, double value, child) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: 2,
                          height: 14 * value,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      );
                    }),
              Text('Item $index', style: getTextStyle(isSelected, context)),
            ],
          ),
        ));
  }
}
