import 'package:go_router/go_router.dart';
import 'package:hr_management/features/auth/presentation/login_feature/view/login_screen.dart';
final GoRouter router = GoRouter(
  initialLocation: '/login',
    routes: <RouteBase>[
      // ───────────────────── Future / Commented Routes ─────────────────────
      // Uncomment when ready to implement:
      //
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      ]
);