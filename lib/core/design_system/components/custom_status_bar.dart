import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';

enum StatusBarEnum { review, approved, rejected }

class CustomStatusBar extends StatefulWidget {
  const CustomStatusBar({super.key});

  @override
  State<CustomStatusBar> createState() => _CustomStatusBarState();
}

class _CustomStatusBarState extends State<CustomStatusBar> {
  late StatusBarEnum statusBarEnum;

  @override
  void initState() {
    statusBarEnum = StatusBarEnum.review;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: context.colors.gray50),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: _statusBarFunc(
              title: "review".tr(),
              num: 3,
              type: StatusBarEnum.review,
            ),
          ),
          Expanded(
            child: _statusBarFunc(
              title: "approved".tr(),
              num: 2,
              type: StatusBarEnum.approved,
            ),
          ),
          Expanded(
            child: _statusBarFunc(
              title: "rejected".tr(),
              num: 2,
              type: StatusBarEnum.rejected,
            ),
          ),
        ],
      ),
    );
  }

  Widget _statusBarFunc({
    required String title,
    required num num,
    required StatusBarEnum type,
  }) {
    bool isSelected = statusBarEnum == type;
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: () {
        if (statusBarEnum != type) {
          //! تحسين: لا تعد بناء الواجهة إذا كان الزر مختاراً بالفعل
          setState(() {
            statusBarEnum = type;
          });
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 21),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: isSelected ? context.colors.purple500 : context.colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            Text(
              title,
              style: context.textTheme.titleMediumFont.copyWith(
                color: isSelected ? context.colors.white : context.colors.black,
              ),
            ),
            if (num < 0 || num != 0)
              ClipOval(
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected
                        ? context.colors.error500
                        : context.colors.gray300,
                  ),
                  child: Text(
                    num.toString(),
                    style: context.textTheme.titleSmallFont.copyWith(
                      color: context.colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
