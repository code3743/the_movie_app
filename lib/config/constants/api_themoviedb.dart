class ApiThemoviedb {
  ApiThemoviedb._();

  static const String apiKey = 'YOUR_API_KEY';
  static const String baseUrl = 'api.themoviedb.org';
  static const String language = 'en-US';
  static const String nowPlaying = '/3/movie/now_playing';
  static const String upcoming = '/3/movie/upcoming';
  static const String popular = '/3/movie/popular';
  static const String search = '/3/search/movie';
  static const String movie = '/3/movie';
  static const String discover = '/3/discover/movie';
  static const String similar = '/similar';
  static const String genre = '/3/genre/movie/list';
  static const String credits = '/credits';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500/';
}
