import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';
import 'package:flutter/widget_previews.dart';

import '../theme/helper/extention_colors.dart';

class StatItemModel {
  final String label;
  final String value;
  final Widget? icon;
  final Color? indicatorColor;

  const StatItemModel({
    required this.label,
    required this.value,
    this.icon,
    this.indicatorColor,
  });
}

class SummaryCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<StatItemModel> items;
  final double indicatorSize;

  final Color? backgroundColor;
  final BoxBorder? border;
  final Color? shadowColor;
  final BorderRadiusGeometry borderRadius;
  final double elevation;
  final EdgeInsetsGeometry cardPadding;
  final EdgeInsetsGeometry? cardMargin;

  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;

  final TextStyle? itemLabelTextStyle;
  final TextStyle? itemValueTextStyle;
  final double itemSpacing;

  final EdgeInsetsGeometry itemPadding;
  final BorderRadiusGeometry itemBorderRadius;
  final Color? itemBackgroundColor;

  // Spacing between title and items
  final double headerSpacing;

  // Whether items should expand equally
  final bool expandItems;


  const SummaryCard({
    super.key,
    required this.title,
    required this.items,
    this.subtitle,
    this.backgroundColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.elevation = 0,
    this.cardPadding = const EdgeInsets.fromLTRB(16, 12, 16, 16),
    this.cardMargin,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.itemLabelTextStyle,
    this.itemValueTextStyle,
    this.itemSpacing = 12,
    this.itemPadding = const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
    this.itemBorderRadius = const BorderRadius.all(Radius.circular(8)),
    this.itemBackgroundColor,
    this.indicatorSize = 10,
    this.headerSpacing = 12,
    this.expandItems = true,
    this.border,
    this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    final themeColors = context.colors;

    return Container(
      margin: cardMargin,
      decoration: BoxDecoration(
        color: backgroundColor ?? themeColors.gray25,
        borderRadius: borderRadius,
        border: border,
        boxShadow: elevation > 0
            ? [
          BoxShadow(
            color: shadowColor ?? themeColors.gray50,
            blurRadius: elevation * 2,
            offset: Offset(0, elevation),
          ),
        ]
            : null,
      ),
      child: Padding(
        padding: cardPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(context),
            SizedBox(height: headerSpacing),
            _buildStatsRow(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final themeColors = context.colors;
    final themeText = context.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleTextStyle ??
              themeText.labelLargeFont.copyWith(
                color: ExtensionColors.textPrimary,
              ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 2),
          Text(
            subtitle!,
            style: subtitleTextStyle ??
                themeText.bodySmallFont.copyWith(
                  color: themeColors.gray500,
                ),
          ),
        ],
      ],
    );
  }

  Widget _buildStatsRow(BuildContext context) {
    return Row(
      children: items.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        final isLast = index == items.length - 1;

        final statWidget = _buildStatItem(item, context);

        if (expandItems) {
          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: isLast ? 0 : itemSpacing),
              child: statWidget,
            ),
          );
        } else {
          return Padding(
            padding: EdgeInsets.only(right: isLast ? 0 : itemSpacing),
            child: statWidget,
          );
        }
      }).toList(),
    );
  }

  Widget _buildStatItem(StatItemModel item, BuildContext context) {
    return Container(
      padding: itemPadding,
      decoration: BoxDecoration(
        color: itemBackgroundColor ?? ExtensionColors.cardBackground,
        borderRadius: itemBorderRadius,
        border: Border.all(color: context.colors.gray50),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (item.icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: item.icon,
                )
              else if (item.indicatorColor != null)
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Container(
                    width: indicatorSize,
                    height: indicatorSize,
                    decoration: BoxDecoration(
                      color: item.indicatorColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              Flexible(
                child: Text(
                  item.label,
                  style: itemLabelTextStyle ??
                      context.textTheme.labelMediumFont.copyWith(
                        color: ExtensionColors.textSecondary,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            item.value,
            style: itemValueTextStyle ??
                context.textTheme.titleLargeFont.copyWith(
                  color: ExtensionColors.textPrimary,
                ),
          ),
        ],
      ),
    );
  }
}


@Preview(name: 'Summary Card')
Widget summaryCardPreview() {
  return const ElevatedButton(
    onPressed: null,
    child: Text('Click Me'),
  );
}