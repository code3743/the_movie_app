import 'package:the_movie_app/config/constants/api_themoviedb.dart';

String formatImageUrl(String path) {
  if (path.isEmpty) {
    return 'https://via.placeholder.com/500x750?text=No+Image';
  }
  return ApiThemoviedb.imageBaseUrl + path;
}
