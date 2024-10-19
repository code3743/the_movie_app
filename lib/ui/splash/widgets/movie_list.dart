import 'package:flutter/material.dart';

class MoviesList extends StatefulWidget {
  const MoviesList({
    super.key,
  });

  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
        ..addListener(() {
          _scrollController.jumpTo(
              _scrollController.position.maxScrollExtent * _animation.value);
        });
    });
    _controller =
        AnimationController(vsync: this, duration: const Duration(minutes: 2));
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: 10,
      itemBuilder: (context, index) {
        return SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: AspectRatio(
                  aspectRatio: 1 / 1.5,
                  child: Image.network(
                      'https://cinexagerar.com/wp-content/uploads/2021/08/CATCHPHRASE_INTL_CHARACTER_BANNER_RYAN_LAS.jpg')),
            ),
          ),
        );
      },
    );
  }
}
