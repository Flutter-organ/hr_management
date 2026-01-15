import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_management/core/design_system/components/custom_primary_button.dart';
import 'package:hr_management/core/design_system/theme/helper/app_assets.dart';
import 'package:hr_management/core/design_system/theme/helper/extention_colors.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';
import 'package:hr_management/core/routes/route_names.dart';
import 'package:hr_management/features/auth/domain/enitites/on_boarding.dart';
import 'package:hr_management/features/auth/presentation/on_boarding_feat/logic/cubit/on_boarding_cubit.dart';
import 'package:hr_management/features/auth/presentation/on_boarding_feat/logic/cubit/on_boarding_state.dart';
import 'package:hr_management/features/auth/presentation/on_boarding_feat/widget/list_generate_widget.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late final OnboardingCubit _onboardingCubit;

  @override
  void initState() {
    super.initState();
    _onboardingCubit = context.read<OnboardingCubit>();
  }

  @override
  void dispose() {
    _onboardingCubit.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          return Column(
            children: [
              _pageView(),
              ListGenerateWidget(
                currentIndex: context.read<OnboardingCubit>().currentIndex,
                onBoardingitems: onBoardingitems,
              ),
              SizedBox(height: 23),
              _nextAndSkipBottons(state),
            ],
          );
        },
      ),
    );
  }

  Widget _pageView() {
    return Expanded(
      child: PageView.builder(
        onPageChanged: (value) {
          context.read<OnboardingCubit>().currentIndex = value;
        },
        controller: context.read<OnboardingCubit>().pageController,
        itemCount: onBoardingitems.length,
        itemBuilder: (context, index) {
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              Image.asset(onBoardingitems[index].image, fit: BoxFit.cover),
              SizedBox(height: 33),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  spacing: 12,
                  children: [
                    Text(
                      onBoardingitems[index].title,
                      textAlign: TextAlign.center,
                      style: context.textTheme.headLineSmallFont.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      onBoardingitems[index].subTitle,
                      textAlign: TextAlign.center,
                      style: context.textTheme.popupBodyFont.copyWith(
                        color: context.colors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _nextAndSkipBottons(OnboardingState state) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, left: 34, right: 34),
      child: Column(
        children: [
          CustomPrimaryButton.gradient(
            buttonText: "next".tr(),
            textStyle: context.textTheme.labelLargeFont,
            onPressed: () {
              if (context.read<OnboardingCubit>().currentIndex ==
                  onBoardingitems.length - 1) {
                context.read<OnboardingCubit>().completeOnboarding();
                context.replaceNamed(RouteNames.onBoardingFinalPageRoute);
              }

              context.read<OnboardingCubit>().nextPage();
              print("$state");
            },
          ),
          SizedBox(height: 15),
          CustomPrimaryButton.outlined(
            buttonText: "skip".tr(),
            textStyle: context.textTheme.labelLargeFont.copyWith(
              color: ExtensionColors.kButtonBackgroundPrimary,
            ),
            onPressed: () {
              context.read<OnboardingCubit>().completeOnboarding();
              print("$state");
              context.replaceNamed(RouteNames.onBoardingFinalPageRoute);
            },
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  List<OnBoardingEntity> onBoardingitems = [
    OnBoardingEntity(
      image: AppAssets.kOnBoargingOne,
      title: 'on_boarding_title_one'.tr(),
      subTitle: 'on_boarding_subtitle_one'.tr(),
    ),
    OnBoardingEntity(
      image: AppAssets.kOnBoargingTwo,
      title: 'on_boarding_title_two'.tr(),
      subTitle: 'on_boarding_subtitle_two'.tr(),
    ),
    OnBoardingEntity(
      image: AppAssets.kOnBoargingThree,
      title: 'on_boarding_title_three'.tr(),
      subTitle: 'on_boarding_subtitle_three'.tr(),
    ),
  ];
}
