import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_management/core/di/injection_container.dart';
import 'package:hr_management/core/routes/route_names.dart';
import '../../features/auth/presentation/on_boarding/logic/cubit/on_boarding_cubit.dart';
import '../../features/auth/presentation/on_boarding/view/on_boarding_final_page.dart';
import '../../features/auth/presentation/on_boarding/view/on_boarding_page.dart';

final GoRouter router = GoRouter(
  initialLocation: RouteNames.onboarding,
  routes: [
    GoRoute(
      path: RouteNames.onboarding,
      name: RouteNames.onboarding,
      builder: (context, state) => BlocProvider(
        create: (_) => sl<OnboardingCubit>(),
        child: const OnBoardingPage(),
      ),
    ),
    GoRoute(
      path: RouteNames.onboardingFinal,
      name: RouteNames.onboardingFinal,
      builder: (context, state) => const OnBoardingFinalPage(),
    ),
  ],
);
