import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_management/core/di/injection_container.dart';
import 'package:hr_management/core/routes/route_names.dart';
import '../../features/auth/presentation/LoginScreen.dart';
import '../../features/auth/presentation/on_boarding/logic/cubit/on_boarding_cubit.dart';
import '../../features/auth/presentation/on_boarding/view/on_boarding_final_page.dart';
import '../../features/auth/presentation/on_boarding/view/on_boarding_page.dart';
import '../../features/auth/presentation/sign_up_screan/view/sign_up_screen.dart';
import 'AppStartupService.dart';

final GoRouter router = GoRouter(
  redirect: (context, state) {
    final startupService = sl<AppStartupService>();
    final onboardingCompleted = startupService.isOnboardingCompleted();

    final location = state.matchedLocation;

    final isOnboarding = location == RouteNames.onboarding;
    final isLogin = location == RouteNames.login;

    if (!onboardingCompleted && !isOnboarding) {
      return RouteNames.onboarding;
    }

    if (onboardingCompleted && isOnboarding) {
      return RouteNames.login;
    }

    return null;
  },

  routes: [
    GoRoute(
      path: RouteNames.onboarding,
      builder: (context, state) => BlocProvider(
        create: (_) => sl<OnboardingCubit>(),
        child: const OnBoardingPage(),
      ),
    ),

    GoRoute(
      path: RouteNames.onboardingFinal,
      builder: (context, state) => const OnBoardingFinalPage(),
    ),

    GoRoute(
      path: RouteNames.login,
      builder: (context, state) => const LoginScreen(),
    ),
  ],
);
