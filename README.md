# The movie app

This is a simple movie app that allows users to search for movies and view details about them. The app uses the [The Movie Database API](https://www.themoviedb.org/) to fetch movie data.


## Features

- Search for movies
- View movie details


## Technologies

- Flutter
- Dart
- The Movie Database API
- Riverpod for state management


## Screenshots


## Getting started

1. Clone the repository

```bash
git clone
```

2. Install dependencies

```bash
flutter pub get
```

3. Replace the API key in the `api_themoviedb.dart` file with your own API
    
```dart
static const String apiKey = 'YOUR_API_KEY';
```

4. Run the app

```bash
flutter run
```


## Structure
    
```bash
├── config
│   ├── constants
│   │   └── api_themoviedb.dart
│   ├── providers
│   │   ├── genre_usecase_provider.dart
│   │   ├── movie_repository_provider.dart
│   │   ├── movie_usecase_provider.dart
│   │   └── search_usecase_provider.dart
│   ├── router
│   │   ├── app_router.dart
│   │   └── app_router_name.dart
│   └── themes
│       ├── app_colors.dart
│       ├── app_fonts.dart
│       ├── app_sizes.dart
│       └── app_themes.dart
├── data
│   ├── api
│   │   ├── datasources
│   │   │   └── themoviedb_datasource.dart
│   │   ├── models
│   │   │   ├── casting_model.dart
│   │   │   ├── genre_model.dart
│   │   │   └── movie_model.dart
│   │   └── repositories
│   │       └── movie_repository_impl.dart
│   └── errors
├── domain
│   ├── datasources
│   │   └── movie_datasource.dart
│   ├── entites
│   │   ├── cast.dart
│   │   ├── genre.dart
│   │   └── movie.dart
│   ├── repositories
│   │   └── movie_repository.dart
│   └── usecases
│       ├── genre_usecase.dart
│       ├── movie_usecase.dart
│       └── search_usecase.dart
├── main.dart
├── shared
│   ├── providers
│   │   ├── genre_provider.dart
│   │   └── now_playing_provider.dart
│   ├── utils
│   │   └── format_image_url.dart
│   └── widgets
│       ├── app_logo.dart
│       ├── custom_button.dart
│       ├── movie_collection.dart
│       ├── movie_tile.dart
│       └── widgets.dart
└── ui
    ├── details
    │   ├── providers
    │   │   └── movie_details_provider.dart
    │   ├── screen
    │   │   └── movie_details.dart
    │   └── widgets
    │       ├── expandable_text.dart
    │       ├── movie_cast.dart
    │       ├── movie_detail.dart
    │       ├── movie_poster.dart
    │       └── widgets.dart
    ├── home
    │   ├── delegate
    │   │   └── movie_search_delegate.dart
    │   ├── providers
    │   │   ├── get_movies_provider.dart
    │   │   ├── movies_by_category_provider.dart
    │   │   └── movie_search_provider.dart
    │   ├── screen
    │   │   └── home_screen.dart
    │   └── widgets
    │       ├── list_category.dart
    │       ├── movie_banner.dart
    │       ├── movie_genre_section.dart
    │       ├── movie_preview.dart
    │       ├── text_category.dart
    │       └── widgets.dart
    └── splash
        ├── screen
        │   └── splash_screen.dart
        └── widgets
            ├── movie_list.dart
            └── movie_splash.dart
```