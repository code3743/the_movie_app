import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie_app/config/router/app_router.dart';
import 'package:the_movie_app/config/themes/app_themes.dart';
import 'package:the_movie_app/common/providers/genre_provider.dart';

void main() {
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(genreProvider);
    return MaterialApp.router(
      title: 'The Movie App',
      routerConfig: ref.watch(appRouterProvider),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
    );
  }
}
