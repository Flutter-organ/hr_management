import 'package:easy_localization/easy_localization.dart';
import 'package:hr_management/core/design_system/theme/helper/app_assets.dart';

class OnBoardingModel {
  final String image, title, subTitle;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.subTitle,
  });
}

List<OnBoardingModel> onBoardingitems = [
  OnBoardingModel(
    image: AppAssets.kOnBoarging1,
    title: 'on_boarding_title_one'.tr(),
    subTitle: 'on_boarding_subtitle_one'.tr(),
  ),
  OnBoardingModel(
    image: AppAssets.kOnBoarging2,
    title: 'on_boarding_title_two'.tr(),
    subTitle: 'on_boarding_subtitle_two'.tr(),
  ),
  OnBoardingModel(
    image: AppAssets.kOnBoarging3,
    title: 'on_boarding_title_three'.tr(),
    subTitle: 'on_boarding_subtitle_three'.tr(),
  ),
];
