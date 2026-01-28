import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_management/core/presentation/routes/route_names.dart';
import 'package:hr_management/features/auth/presentation/on_boarding/logic/on_boarding_cubit.dart';
import 'package:hr_management/features/home/presentation/view/home_screen.dart';
import 'package:hr_management/core/di/injection_container.dart';
import '../../../features/auth/presentation/login/logic/login_cubit.dart';
import '../../../features/auth/presentation/login/view/screen/login_screen.dart';
import '../../../features/auth/presentation/on_boarding/view/on_boarding_page.dart';
import '../../../features/auth/presentation/register/signup/logic/sign_up_cubit.dart';
import '../../../features/auth/presentation/register/signup/view/screen/sign_up_screen.dart';
import '../../../features/main_navigation/presentation/screens/main_wrapper_screen.dart';
import 'config/app_state_notifier.dart';

final GoRouter router = GoRouter(
  refreshListenable: AuthStateNotifier.instance,
  redirect: _handleRedirect,
  initialLocation: RouteNames.expenseScreen,
  debugLogDiagnostics: true,
  errorBuilder: (context, state) => _ErrorScreen(
    error: state.error?.toString() ?? 'Page not found',
    path: state.uri.toString(),
  ),
  routes: [
    // ═══════════════════════════════════════════
    // ONBOARDING (Single Route - 4 Pages in Pager)
    // ═══════════════════════════════════════════
    GoRoute(
      path: RouteNames.onboarding,
      name: 'onboarding',
      builder: (context, state) => BlocProvider(
        create: (_) => sl<OnboardingCubit>(),
        child: const OnBoardingPage(),
      ),
    ),

    // ═══════════════════════════════════════════
    // AUTH ROUTES
    // ═══════════════════════════════════════════
    GoRoute(
      path: RouteNames.login,
      name: 'login',
      builder: (context, state) => BlocProvider(
        create: (_) => sl<LoginCubit>(),
        child: const LoginScreen(),
      ),
    ),
    GoRoute(
      path: RouteNames.register,
      name: 'register',
      builder: (context, state) => BlocProvider(
        create: (_) => sl<SignUpCubit>(),
        child: const SignUpScreen(),
      ),
    ),

    // ═══════════════════════════════════════════
    // MAIN APP ROUTES
    // ═══════════════════════════════════════════
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainWrapperScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RouteNames.homeScreen,
              name: 'home',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RouteNames.attendantScreen,
              name: 'attendant',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RouteNames.taskScreen,
              name: 'task',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RouteNames.expenseScreen,
              name: 'expense',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RouteNames.leaveScreen,
              name: 'leave',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);

String? _handleRedirect(BuildContext context, GoRouterState state) {
  final authState = AuthStateNotifier.instance;
  final isLoggedIn = authState.isLoggedIn;
  final onboardingCompleted = authState.isOnboardingCompleted;
  final location = state.matchedLocation;

  final isAuthRoute = RouteNames.isAuthRoute(location);
  final isOnboardingRoute = RouteNames.isOnboardingRoute(location);
  final isProtectedRoute = RouteNames.isProtectedRoute(location);

  // CASE 1: User is LOGGED IN
  if (isLoggedIn) {
    if (isAuthRoute || isOnboardingRoute) {
      return RouteNames.homeScreen;
    }
    return null;
  }

  // CASE 2: NOT logged in, trying to access PROTECTED route
  if (isProtectedRoute) {
    if (!onboardingCompleted) {
      return RouteNames.onboarding;
    }
    return RouteNames.login;
  }

  // CASE 3: NOT logged in, Onboarding NOT complete
  if (!onboardingCompleted) {
    if (isOnboardingRoute) {
      return null;
    }
    return RouteNames.onboarding;
  }

  // CASE 4: NOT logged in, Onboarding COMPLETE
  if (isOnboardingRoute) {
    return RouteNames.login;
  }

  if (isAuthRoute) {
    return null;
  }

  return RouteNames.login;
}

class _ErrorScreen extends StatelessWidget {
  const _ErrorScreen({required this.error, required this.path});

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
              const Icon(Icons.error_outline, size: 80, color: Colors.red),
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
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
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
