import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_management/core/routes/route_names.dart';
import 'package:hr_management/main.dart';
final GoRouter router = GoRouter(
  initialLocation: "/home",
    routes: <RouteBase>[
      // ───────────────────── Future / Commented Routes ─────────────────────
      // Uncomment when ready to implement:
      //
      GoRoute(
        path: "/home",
        builder: (context, state) => const Test(),
      ),
      ]
);