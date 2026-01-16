import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';

import '../model/on_boarding.dart';

class OnboardingPageContent extends StatelessWidget {
  final OnboardingItem item;

  const OnboardingPageContent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // Calculate image height based on screen size
    final imageHeight = MediaQuery.of(context).size.height * 0.5;

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        // Fixed height container prevents layout shift
        SizedBox(
          height: imageHeight,
          width: double.infinity,
          child: Image.asset(
            item.image,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 33),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Text(
                item.title,
                textAlign: TextAlign.center,
                style: context.textTheme.headLineSmallFont.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                item.subTitle,
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
  }
}