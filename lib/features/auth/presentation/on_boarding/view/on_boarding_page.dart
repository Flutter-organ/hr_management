import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_management/core/design_system/components/custom_primary_button.dart';
import 'package:hr_management/core/design_system/theme/helper/app_assets.dart';
import 'package:hr_management/core/design_system/theme/helper/extention_colors.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';
import 'package:hr_management/core/routes/route_names.dart';

import '../logic/cubit/on_boarding_cubit.dart';
import '../logic/cubit/on_boarding_state.dart';
import '../model/on_boarding.dart';
import '../widget/OnboardingDotsIndicator.dart';
import '../widget/onboarding_page_content.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late final PageController _pageController;

  static final List<OnboardingItem> _items = [
    OnboardingItem(
      image: AppAssets.kOnBoargingOne,
      title: 'on_boarding_title_one'.tr(),
      subTitle: 'on_boarding_subtitle_one'.tr(),
    ),
    OnboardingItem(
      image: AppAssets.kOnBoargingTwo,
      title: 'on_boarding_title_two'.tr(),
      subTitle: 'on_boarding_subtitle_two'.tr(),
    ),
    OnboardingItem(
      image: AppAssets.kOnBoargingThree,
      title: 'on_boarding_title_three'.tr(),
      subTitle: 'on_boarding_subtitle_three'.tr(),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (final item in _items) {
        precacheImage(AssetImage(item.image), context);
      }
      precacheImage(
        const AssetImage(AppAssets.kOnBoargingFinal),
        context,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<OnboardingCubit, OnboardingState>(
            listenWhen: (previous, current) =>
            previous.currentIndex != current.currentIndex,
            listener: _onPageIndexChanged,
          ),
          BlocListener<OnboardingCubit, OnboardingState>(
            listenWhen: (previous, current) =>
            previous.shouldNavigateToFinal != current.shouldNavigateToFinal &&
                current.shouldNavigateToFinal == true,
            listener: _onNavigationTriggered,
          ),
        ],
        child: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            return Column(
              children: [
                _buildPageView(context),
                OnboardingDotsIndicator(
                  currentIndex: state.currentIndex,
                  itemCount: _items.length,
                ),
                const SizedBox(height: 23),
                _buildButtons(context, state),
              ],
            );
          },
        ),
      ),
    );
  }


  void _onPageIndexChanged(BuildContext context, OnboardingState state) {
    if (_pageController.page?.round() != state.currentIndex) {
      _pageController.animateToPage(
        state.currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _onNavigationTriggered(BuildContext context, OnboardingState state) {
    if (state.shouldNavigateToFinal) {
      context.read<OnboardingCubit>().onNavigationHandled();
      context.replaceNamed(RouteNames.onboardingFinal);
    }
  }

  Widget _buildPageView(BuildContext context) {
    return Expanded(
      child: PageView(
        controller: _pageController,
        onPageChanged: context.read<OnboardingCubit>().onPageChanged,
        children: _items
            .map((item) => OnboardingPageContent(item: item))
            .toList(),
      ),
    );
  }
  Widget _buildButtons(BuildContext context, OnboardingState state) {
    final cubit = context.read<OnboardingCubit>();
    final isLoading = state.status == OnboardingStatus.loading;

    return Padding(
      padding: const EdgeInsets.fromLTRB(34, 0, 34, 30),
      child: Column(
        children: [
          CustomPrimaryButton.gradient(
            buttonText: state.isLastPage ? 'get_started'.tr() : 'next'.tr(),
            textStyle: context.textTheme.labelLargeFont,
            onPressed: isLoading ? null : cubit.onNextPressed,
          ),
          const SizedBox(height: 15),
          CustomPrimaryButton.outlined(
            buttonText: 'skip'.tr(),
            textStyle: context.textTheme.labelLargeFont.copyWith(
              color: ExtensionColors.kButtonBackgroundPrimary,
            ),
            onPressed: isLoading ? null : cubit.onSkipPressed,
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
