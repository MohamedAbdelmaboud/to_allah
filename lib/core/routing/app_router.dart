import 'package:go_router/go_router.dart';

import '../../features/login/ui/view/login_view.dart';
import '../../features/splash/ui/view/splash_view.dart';

class AppRouter {
  static const String splash = '/';
  static const String login = '/login';
  static final router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => const LoginView(),
      ),
    ],
  );
}
