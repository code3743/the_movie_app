import 'package:flutter/material.dart';
import 'package:the_movie_app/config/themes/app_colors.dart';
import 'package:the_movie_app/ui/splash/widgets/movie_list.dart';

class MovieSplash extends StatelessWidget {
  const MovieSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: MoviesList(),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: CinematicPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

/// A custom painter that draws a series of rectangles on the canvas to create
/// a cinematic effect.
///
/// The [CinematicPainter] class extends [CustomPainter] and overrides the
/// [paint] method to draw rectangles at regular intervals along the height of
/// the canvas. The rectangles are drawn on both the left and right sides of
/// the canvas.
///
/// The color, stroke width, and style of the rectangles are defined by the
/// [Paint] object. The rectangles are drawn using the [drawRect] method, which
/// creates a path for each rectangle and draws it on the canvas.
///
/// The [shouldRepaint] method returns `false`, indicating that the painter
/// does not need to repaint when the delegate changes.
class CinematicPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.secondary
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;
    for (var i = 0; i < size.height / 40; i++) {
      drawRect(paint, canvas, size.width * .1 - 20, 40 * i.toDouble());
      drawRect(paint, canvas, size.width * .9, 40 * i.toDouble());
    }
  }

  /// Draws a rectangle on the given canvas using the specified paint.
  ///
  /// The rectangle is drawn at the specified (x, y) coordinates with a width
  /// and height of 20 units, and rounded corners with a radius of 5 units.
  ///
  /// - Parameters:
  ///   - paint: The paint used to draw the rectangle.
  ///   - canvas: The canvas on which the rectangle is drawn.
  ///   - x: The x-coordinate of the top-left corner of the rectangle.
  ///   - y: The y-coordinate of the top-left corner of the rectangle.
  void drawRect(Paint paint, Canvas canvas, double x, double y) {
    final path = Path();
    path.addRRect(RRect.fromLTRBR(x, y, x + 20, y + 20, Radius.circular(5)));
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
