import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_management/core/routes/route_names.dart';

import '../../features/auth/presentation/view/screens/login/login_screen.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: RouteNames.login,
    debugLogDiagnostics: true,
    errorBuilder: (context, state) => _ErrorScreen(
      error: state.error?.toString() ?? 'Page not found',
      path: state.uri.toString(),
    ),

    routes: <RouteBase>[
      GoRoute(
        path: RouteNames.login,
        name: RouteNames.login,
        builder: (context, state) => const LoginScreen(),
      ),

    ]
);


class _ErrorScreen extends StatelessWidget {
  const _ErrorScreen({
    required this.error,
    required this.path,
  });

  final String error;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 80,
                color: Colors.red,
              ),
              const SizedBox(height: 24),
              Text(
                '404',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Page Not Found',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              Text(
                'The page "$path" does not exist.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () => context.go(RouteNames.login),
                icon: const Icon(Icons.home),
                label: const Text('Go to Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}