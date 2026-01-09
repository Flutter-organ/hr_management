import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_management/core/design_system/components/custom_primary_button.dart';
import 'package:hr_management/core/design_system/theme/helper/extention_colors.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';
import 'package:hr_management/core/routes/route_names.dart';
import 'package:hr_management/features/on_boarding/model/on_boarding_model.dart';
import 'package:hr_management/features/on_boarding/presentation/widget/list_generate_widget.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              controller: pageController,
              itemCount: onBoardingitems.length,
              itemBuilder: (context, index) {
                return ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Image.asset(
                      onBoardingitems[index].image,
                      fit: BoxFit.cover,
                    ),
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
          ),
          ListGenerateWidget(currentIndex: currentIndex),
          SizedBox(height: 23),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                CustomPrimaryButton.gradient(
                  buttonText: "next".tr(),
                  textStyle: context.textTheme.labelLargeFont,
                  onPressed: () {
                    if (currentIndex == onBoardingitems.length - 1) {
                      context.replace(RouteNames.onBoardingFinalPageRoute);
                    }
                    pageController.animateToPage(
                      ++currentIndex,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                ),
                SizedBox(height: 15),
                CustomPrimaryButton.outlined(
                  buttonText: "skip".tr(),
                  textStyle: context.textTheme.labelLargeFont.copyWith(
                    color: ExtensionColors.kButtonBackgroundPrimary,
                  ),
                  onPressed: () {
                    context.replace(RouteNames.onBoardingFinalPageRoute);
                  },
                ),
                SizedBox(height: 35),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
