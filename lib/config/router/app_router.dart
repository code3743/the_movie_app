import 'package:flutter/material.dart' show GlobalKey, NavigatorState;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movie_app/domain/entites/movie.dart';
import 'package:the_movie_app/ui/home/screen/home_screen.dart';
import 'package:the_movie_app/config/router/app_router_name.dart';
import 'package:the_movie_app/ui/details/screen/movie_details.dart';
import 'package:the_movie_app/ui/splash/screen/splash_screen.dart';

final appRouterProvider = Provider((ref) => GoRouter(
        navigatorKey: GlobalKey<NavigatorState>(),
        initialLocation: AppRouterName.splash,
        routes: [
          GoRoute(
            path: AppRouterName.splash,
            builder: (context, state) => const SplashScreen(),
          ),
          GoRoute(
              path: AppRouterName.home,
              builder: (context, state) => const HomeScreen(),
              routes: [
                GoRoute(
                    path: AppRouterName.movieDetail,
                    builder: (context, state) {
                      final movie = state.extra as Movie;
                      return MovieDetails(movie: movie);
                    })
              ]),
        ]));
