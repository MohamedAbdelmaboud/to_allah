import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:to_allah/features/login/cubits/login_cubit.dart';

import '../../features/home/ui/view/home_view.dart';
import '../../features/login/ui/view/login_view.dart';
import '../../features/splash/ui/view/splash_view.dart';

class AppRouter {
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
  static final router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: home,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
