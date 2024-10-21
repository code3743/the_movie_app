import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movie_app/config/router/app_router_name.dart';
import 'package:the_movie_app/config/themes/app_colors.dart';
import 'package:the_movie_app/shared/widgets/widgets.dart';
import 'package:the_movie_app/ui/splash/widgets/movie_splash.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          MovieSplash(),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.1,
                    0.3,
                    .8,
                  ]),
            ),
          ),
          Positioned(top: 50, child: AppLogo()),
          Positioned(
            bottom: 20,
            child: Container(
                width: size.width * .9,
                height: 250,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.accentDark,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Welcome to ',
                          style: Theme.of(context).textTheme.titleMedium,
                          children: [
                            TextSpan(
                              text: 'The Movie App!',
                              style: TextStyle(
                                color: Color(0xFFd12f26),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: ' Your favorite movies in one place.',
                            ),
                          ],
                        )),
                    Text(
                      'Get access to thousands of movies.',
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                    CustomButton(
                      text: 'Get Started',
                      onPressed: () => context.go(AppRouterName.home),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
