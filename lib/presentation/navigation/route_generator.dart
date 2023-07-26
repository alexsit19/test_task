import 'package:flutter/material.dart';
import 'package:test_task/presentation/features/posts/posts_screen.dart';
import 'package:test_task/presentation/features/single_post/single_post_screen.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.postsScreen:
        return MaterialPageRoute(builder: (context) => const PostsScreen());
      case AppRoutes.singlePostScreen:
        return MaterialPageRoute(settings: settings, builder: (context) => const SinglePostScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('ERROR'),
            centerTitle: true,
          ),
          body: const Center(
            child: Text('Page not found'),
          ),
        );
      },
    );
  }
}
