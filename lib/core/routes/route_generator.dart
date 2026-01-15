import 'package:go_router/go_router.dart';
import 'package:hr_management/core/routes/route_names.dart';
import 'package:hr_management/features/auth/presentation/login_feature/view/login_screen.dart';
import 'package:hr_management/features/home/presentation/view/home_screen.dart';

GoRouter createRouter(String intialLocation) {
  return GoRouter(
    initialLocation: intialLocation,
    routes: <RouteBase>[
      // ───────────────────── Future / Commented Routes ─────────────────────
      // Uncomment when ready to implement:
      //
      GoRoute(
        path: RouteNames.loginRoute,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RouteNames.homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
