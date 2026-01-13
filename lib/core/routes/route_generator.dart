import 'package:go_router/go_router.dart';
import 'package:hr_management/core/routes/route_names.dart';

import '../../features/auth/presentation/onBoardingScreen.dart';
final GoRouter router = GoRouter(
    routes: <RouteBase>[
      // ───────────────────── Future / Commented Routes ─────────────────────
      // Uncomment when ready to implement:
      //
      GoRoute(
        path: RouteNames.onBoardingPageRoute,
        name: RouteNames.onBoardingPageRoute,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      ]
);