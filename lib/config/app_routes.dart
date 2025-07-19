import 'package:go_router/go_router.dart';
import 'package:smart_wallet/features/add_expense/presentation/screens/add_expense_screen.dart';
import 'package:smart_wallet/features/auth/presentation/screens/login_screen.dart';
import 'package:smart_wallet/features/auth/presentation/screens/signup_screen.dart';
import 'package:smart_wallet/features/bottom_nav/presentation/screens/bottom_nav_screen.dart';
import 'package:smart_wallet/features/splash_screen/presentation/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = "SplashScreen";
  static const String bottomNavScreen = "BottomNavScreen";
  static const String loginScreen = "LoginScreen";
  static const String signupScreen = "SignupScreen";
  static const String addExpenseScreen = "AddExpenseScreen";

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
      GoRoute(
        path: '/loginScreen',
        name: loginScreen,
        builder: (context, state) {
          return LoginScreen();
        },
      ),
      GoRoute(
        path: '/signupScreen',
        name: signupScreen,
        builder: (context, state) {
          return SignupScreen();
        },
      ),
      GoRoute(
        path: "/addExpense",
        name: addExpenseScreen,
        builder: (context, state) {
          return AddExpenseScreen();
        },
      ),
    ],
  );
}
