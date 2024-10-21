import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_app/common/utils/format_image_url.dart';

void main() {
  group('Format image url', () {
    test('empty case', () {
      final format = formatImageUrl('');
      expect(format, 'https://via.placeholder.com/500x750?text=No+Image');
    });

    test('valid case', () {
      final format = formatImageUrl('/image.jpg');
      expect(format, 'https://image.tmdb.org/t/p/w500/image.jpg');
    });
  });
}
