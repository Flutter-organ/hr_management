import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_management/core/routes/route_names.dart';
import 'package:hr_management/main.dart';

import '../../features/auth/presentation/onBoardingScreen.dart';
import '../../features/auth/presentation/sign_up_screan/view/sign_up_screen.dart';
final GoRouter router = GoRouter(
    routes: <RouteBase>[
      // ───────────────────── Future / Commented Routes ─────────────────────
      // Uncomment when ready to implement:
      //
      GoRoute(
        path: "/",
        builder: (context, state) => OnBoardingScreen(),
      ),
      ]
);