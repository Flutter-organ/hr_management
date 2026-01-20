import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_management/core/routes/route_names.dart';
import 'package:hr_management/features/home/presentation/view/home_screen.dart';
import '../../features/auth/presentation/login/logic/login_cubit.dart';
import '../../features/auth/presentation/login/view/screen/login_screen.dart';
import 'package:hr_management/core/di/injection_container.dart';
import '../../features/auth/presentation/on_boarding/logic/cubit/on_boarding_cubit.dart';
import '../../features/auth/presentation/on_boarding/view/on_boarding_final_page.dart';
import '../../features/auth/presentation/on_boarding/view/on_boarding_page.dart';
import '../../features/auth/presentation/sign_up/logic/sign_up_cubit.dart';
import '../../features/auth/presentation/sign_up/view/screen/sign_up_screen.dart';
import 'AppStartupService.dart';

final GoRouter router = GoRouter(
    redirect: (context, state) async {
      final startupService = sl<AppStartupService>();
      final onboardingCompleted = startupService.isOnboardingCompleted();
      final isLoggedIn = await startupService.isLoggedIn();
      final location = state.matchedLocation;

      if (isLoggedIn) {
        if (location == RouteNames.login ||
            location == RouteNames.onboarding ||
            location == RouteNames.register) {
          return RouteNames.homeScreen;
        }
        return null;
      }

      if (!onboardingCompleted && location != RouteNames.onboarding) {
        return RouteNames.onboarding;
      }

      if (onboardingCompleted &&
          location != RouteNames.login &&
          location != RouteNames.register &&
          location != RouteNames.onboardingFinal) {
        return RouteNames.login;
      }


      return null;
    },
    //initialLocation: RouteNames.login,
    debugLogDiagnostics: true,
    errorBuilder: (context, state) => _ErrorScreen(
      error: state.error?.toString() ?? 'Page not found',
      path: state.uri.toString(),
    ),

    routes: <RouteBase>[
      GoRoute(
        path: RouteNames.homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),

      GoRoute(
        path: RouteNames.onboarding,
        builder: (context, state) => BlocProvider(
          create: (_) => sl<OnboardingCubit>(),
          child: const OnBoardingPage(),
        ),
      ),

      GoRoute(
        path: RouteNames.onboardingFinal,
        builder: (context, state) => BlocProvider(
          create: (_) => sl<OnboardingCubit>(),
          child: const OnBoardingFinalPage(),
        ),
      ),

      GoRoute(
        path: RouteNames.login,
        builder: (context, state) => BlocProvider(
          create: (_) => sl<LoginCubit>(),
          child: const LoginScreen(),
        ),
      ),

      GoRoute(
        path: RouteNames.register,
        builder: (context, state) => BlocProvider(
          create: (_) => sl<SignUpCubit>(),
          child: const SignUpScreen(),
        ),
      )

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