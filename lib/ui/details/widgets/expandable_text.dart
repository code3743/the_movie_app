import 'package:flutter/material.dart';
import 'package:the_movie_app/config/themes/app_colors.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLength;

  const ExpandableText({super.key, required this.text, this.maxLength = 100});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final String displayText = isExpanded
        ? widget.text
        : widget.text.length > widget.maxLength
            ? '${widget.text.substring(0, widget.maxLength)}...'
            : widget.text;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: RichText(
              text: TextSpan(
                  text: displayText,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.textSecondary),
                  children: [
                if (!isExpanded && widget.text.length > widget.maxLength)
                  TextSpan(
                    text: 'Read more',
                    style: TextStyle(
                      color: AppColors.accent,
                      fontWeight: FontWeight.w500,
                    ),
                  )
              ])),
        ),
      ],
    );
  }
}
