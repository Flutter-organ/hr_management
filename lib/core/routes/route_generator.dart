import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_management/core/di/injection_container.dart';
import 'package:hr_management/core/routes/route_names.dart';
import 'package:hr_management/features/presentation/on_boarding_feat/logic/cubit/on_boarding_cubit.dart';
import 'package:hr_management/features/presentation/on_boarding_feat/view/on_boarding_final_page.dart';
import 'package:hr_management/features/presentation/on_boarding_feat/view/on_boarding_page.dart';

final GoRouter router = GoRouter(
  initialLocation: RouteNames.onBoardingPageRoute,
  routes: <RouteBase>[
    // ───────────────────── Future / Commented Routes ─────────────────────
    // Uncomment when ready to implement:
    //
    GoRoute(
      path: RouteNames.onBoardingPageRoute,
      name: RouteNames.onBoardingPageRoute,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<OnboardingCubit>(),
        child: const OnBoardingPage(),
      ),
    ),
    GoRoute(
      path: RouteNames.onBoardingFinalPageRoute,
      name: RouteNames.onBoardingFinalPageRoute,
      builder: (context, state) => const OnBoardingFinalPage(),
    ),
  ],
);
