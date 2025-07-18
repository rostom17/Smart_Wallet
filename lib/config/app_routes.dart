import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String homeScreen = "HomeScreen";

  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: homeScreen,
        builder: (context, state) {
          return Placeholder();
        },
      ),
    ],
  );
}
