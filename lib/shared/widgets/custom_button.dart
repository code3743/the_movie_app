import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.width,
  });

  final String text;
  final void Function()? onPressed;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width ?? double.infinity,
        child: FilledButton(
          style: FilledButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onPressed: onPressed,
          child: Text(text, style: Theme.of(context).textTheme.titleMedium),
        ));
  }
}
