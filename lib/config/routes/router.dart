import 'package:go_router/go_router.dart';

sealed class Routes {
  static const splash = '/';
}

sealed class AppRouter {
  static final config = GoRouter(
    initialLocation: Routes.splash,
    routes: [
      // GoRoute(
      //   path: Routes.splash,
      //   builder: (ctx, _) => SplashPage(viewModel: ctx.read()),
      // ),
    ],
  );
}
