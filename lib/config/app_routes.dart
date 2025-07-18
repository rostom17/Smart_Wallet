import 'package:go_router/go_router.dart';
import 'package:smart_wallet/features/bottom_nav/presentation/screens/bottom_nav_screen.dart';
import 'package:smart_wallet/features/splash_screen/presentation/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = "SplashScreen";
  static const String bottomNavScreen = "BottomNavScreen";

  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: splashScreen,
        builder: (context, state) {
          return SplashScreen();
        },
      ),
      GoRoute(
        path: '/bottomNavScreen',
        name: bottomNavScreen,
        builder: (context, state) {
          return BottomNavScreen();
        },
      ),
    ],
  );
}
