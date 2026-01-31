import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_management/core/presentation/routes/route_names.dart';
import 'package:hr_management/features/attendance/presentation/clock_in/logic/attendance_screen_cubit.dart';
import 'package:hr_management/features/auth/presentation/on_boarding/logic/on_boarding_cubit.dart';
import 'package:hr_management/features/home/presentation/view/home_screen.dart';
import 'package:hr_management/core/di/injection_container.dart';
import 'package:latlong2/latlong.dart';
import '../../../features/attendance/presentation/clock_in/view/screen/LocationScreen.dart';
import '../../../features/attendance/presentation/clock_in/view/screen/attendance_screen.dart';
import '../../../features/attendance/presentation/clock_in/view/screen/camera_preview_screen.dart';
import '../../../features/attendance/presentation/clock_in/view/screen/conformation_camera_screen.dart';
import '../../../features/auth/presentation/login/logic/login_cubit.dart';
import '../../../features/auth/presentation/login/view/screen/login_screen.dart';
import '../../../features/auth/presentation/on_boarding/view/on_boarding_final_page.dart';
import '../../../features/auth/presentation/on_boarding/view/on_boarding_page.dart';
import '../../../features/auth/presentation/register/signup/logic/sign_up_cubit.dart';
import '../../../features/auth/presentation/register/signup/view/screen/sign_up_screen.dart';
import '../../../features/main_navigation/presentation/screens/main_wrapper_screen.dart';
import 'config/app_state_notifier.dart';

final GoRouter router = GoRouter(
  refreshListenable: AuthStateNotifier.instance,
  redirect: _handleRedirect,
  initialLocation: RouteNames.onboarding,
  debugLogDiagnostics: true,
  errorBuilder: (context, state) => _ErrorScreen(
    error: state.error?.toString() ?? 'Page not found',
    path: state.uri.toString(),
  ),
  routes: [
    GoRoute(
      path: RouteNames.onboarding,
      name: 'onboarding',
      builder: (context, state) => BlocProvider(
        create: (_) => sl<OnboardingCubit>(),
        child: const OnBoardingPage(),
      ),
    ),
    GoRoute(
      path: RouteNames.onboardingFinal,
      name: 'onboarding-final',
      builder: (context, state) => BlocProvider(
        create: (_) => sl<OnboardingCubit>(),
        child: const OnBoardingFinalPage(),
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
        return MainWrapperScreen(
          navigationShell: navigationShell,
        );
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
              builder: (context, state) => BlocProvider(
                create: (_) => sl<AttendanceScreenCubit>(),
                child: const AttendanceScreen(),
              ),
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
    // ✅ شاشة خريطة تسجيل الحضور
    GoRoute(
      path: RouteNames.clockInMap,
      name: 'clockInMap',
      builder: (context, state) => const ClockInScreen(),
    ),

    // ✅ شاشة الكاميرا مع استقبال البيانات من الخريطة
    GoRoute(
      path: RouteNames.selfieCamera,
      name: 'selfieCamera',
      builder: (context, state) {
        // ✅ استقبال البيانات من الشاشة السابقة
        final extra = state.extra as Map<String, dynamic>?;

        if (extra == null) {
          // إذا مفيش بيانات، نرجع للشاشة الرئيسية
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.go(RouteNames.attendantScreen);
          });
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final lat = extra['lat'] as double? ?? 0.0;
        final long = extra['long'] as double? ?? 0.0;
        final location = LatLng(lat, long);

        return CameraPreviewScreen(location: location);
      },
    ),

    // ✅ شاشة التأكيد
    GoRoute(
      path: RouteNames.confirmationScreen,
      name: 'confirmationScreen',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;

        if (extra == null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.go(RouteNames.attendantScreen);
          });
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final capturedImage = extra['capturedImage'] as XFile;
        final lat = extra['lat'] as double;
        final long = extra['long'] as double;
        final location = LatLng(lat, long);

        return ConfirmationScreen(
          capturedImage: capturedImage,
          location: location,
        );
      },
    ),
  ],
);


String? _handleRedirect(BuildContext context, GoRouterState state) {
  final authState = AuthStateNotifier.instance;
  final isLoggedIn = authState.isLoggedIn;
  final onboardingCompleted = authState.isOnboardingCompleted;
  final location = state.matchedLocation;

  final isAuthRoute =
      location == RouteNames.login || location == RouteNames.register;
  final isOnboardingRoute =
      location == RouteNames.onboarding ||
      location == RouteNames.onboardingFinal;

  if (isLoggedIn) {
    if (isAuthRoute || isOnboardingRoute) {
      return RouteNames.homeScreen;
    }
    return null;
  }

  if (!onboardingCompleted) {
    if (isOnboardingRoute) {
      return null;
    }
    return RouteNames.onboarding;
  }

  if (isAuthRoute || location == RouteNames.onboardingFinal) {
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
