import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/components/custom_primary_button.dart';
import 'package:hr_management/core/design_system/components/selectable_chip.dart';
import 'package:hr_management/core/design_system/theme/color/app_constant_colors.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';

class CustomPopupList extends StatefulWidget {
  const CustomPopupList({
    super.key,
    required this.title,
    required this.subtitle,
    required this.options,  this.onCancel,  this.onConfirm,
  });
  final String title;
  final String subtitle;
  final List<String> options;
  final  VoidCallback? onCancel,onConfirm;
  @override
  State<CustomPopupList> createState() => _CustomPopupListState();
}

class _CustomPopupListState extends State<CustomPopupList> {
  int? selectedIndex;
  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: context.textTheme.headLineSmallFont.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            widget.subtitle,
            style: context.textTheme.labelLargeFont.copyWith(
              color: AppConstantColors.gray200,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20),

          Expanded(
            child: ListView.separated(
              itemCount: widget.options.length,
              itemBuilder: (context, index) => SelectableCheckChip(
                label: widget.options[index],
                isSelected: selectedIndex == index,
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(height: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomPrimaryButton(
                    // width: 200,
                    buttonText: "cancel".tr(),
                    buttonType: ButtonType.outlined,
                    height: 52,
                    borderRadius: 30,
                    borderColor: AppConstantColors.purple900,
                    foregroundColor: AppConstantColors.purple900,
                    textStyle: context.textTheme.labelLargeFont,
                    onPressed: widget.onCancel,
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: CustomPrimaryButton(
                    // width: 200,
                    buttonText: "select".tr(),
                    buttonType: ButtonType.filled,
                    height: 52,
                    borderRadius: 30,
                    backgroundColor: AppConstantColors.purple400,
                    textStyle: context.textTheme.labelLargeFont,
                    onPressed:widget.onConfirm,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
