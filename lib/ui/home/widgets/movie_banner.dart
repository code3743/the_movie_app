import 'dart:async';

import 'package:flutter/material.dart';
import 'package:the_movie_app/config/themes/app_colors.dart';

class MovieBanner extends StatefulWidget {
  const MovieBanner({
    super.key,
  });

  @override
  State<MovieBanner> createState() => _MovieBannerState();
}

class _MovieBannerState extends State<MovieBanner> {
  final _pageController = PageController();
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 9) {
        _currentPage++;
      } else {
        _currentPage = 0;
        _pageController.jumpToPage(0);
        return;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 400,
      child: PageView.builder(
          controller: _pageController,
          itemCount: 10,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                print('Selected index: $index');
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Stray_calico_cat_near_Sagami_River-01.jpg/640px-Stray_calico_cat_near_Sagami_River-01.jpg',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              AppColors.background.withOpacity(.8),
                              Colors.transparent,
                              AppColors.background,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0, 0.5, 1])),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
