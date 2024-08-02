import 'package:go_router/go_router.dart';
import 'package:to_allah/features/splash/view/splash_screen.dart';

import '../../features/splash/view/splash_view.dart';

class AppRouter {
  static const String splash = '/';
  static final goRouter=GoRouter(routes: [
    GoRoute(
      path: splash,
      builder: (context, state) => const SplashView(),
    ),
}