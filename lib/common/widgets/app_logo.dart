import 'package:flutter/material.dart';
import 'package:the_movie_app/config/themes/app_colors.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.scale = 1,
  });
  final double scale;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 150 * scale,
        height: 50 * scale,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('EMPLEAMOS',
                style: TextStyle(
                    color: AppColors.accent,
                    fontSize: 20 * scale,
                    height: 1,
                    fontWeight: FontWeight.bold)),
            Text('TEMPORALES',
                style: TextStyle(
                    color: AppColors.primary,
                    height: 1,
                    fontSize: 20 * scale,
                    fontWeight: FontWeight.bold)),
          ],
        ));
  }
}
