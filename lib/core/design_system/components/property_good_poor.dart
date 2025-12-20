import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';

enum BurnoutStatus {
  good,
  okay,
  poor,
  pad;

  String get label => switch (this) {
    good => "Good",
    okay => "Okay",
    poor => "Poor",
    pad => "Pad",
  };

  String get emojiPath => switch (this) {
    good => "assets/images/good.png",
    okay => "assets/images/okay.png",
    poor => "assets/images/poor.png",
    pad => "assets/images/pad.png",
  };

  double get value => switch (this) {
    good => 0.25,
    okay => 0.45,
    poor => 0.85,
    pad => 1.0,
  };
}

class PropertyGoodPoor extends StatelessWidget {
  final BurnoutStatus status;
  const PropertyGoodPoor({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final color = context.colors;
    final textStyle = context.textTheme;

    final statusColor = switch (status) {
      BurnoutStatus.pad => color.pad,
      BurnoutStatus.poor => color.poor,
      BurnoutStatus.okay => color.okay,
      BurnoutStatus.good => color.good,
    };
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color.onPrimary,
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Text(
                "Sprint 20 - Burnout Stats",
                style: textStyle.titleLargeFontSemiBold,
              ),
              SizedBox(width: 4),
              Container(
                padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  status.label,
                  style: textStyle.titleMediumFont.copyWith(
                    color: color.onPrimary,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 12),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "You've completed ",
                    style: textStyle.bodySmallFont,
                  ),
                  TextSpan(
                    text: "2x more tasks than usual, ",
                    style: textStyle.bodySmallFont.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: "maintain your\ntask with your supervisor ",
                    style: textStyle.bodySmallFont,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.primaryVariant,
              border: Border.all(color: color.stroke),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(status.emojiPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: SliderTheme(
                    data: SliderThemeData(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0),
                      activeTrackColor: statusColor,
                      inactiveTrackColor: color.stroke,

                      overlayShape: SliderComponentShape.noThumb,
                      trackHeight: 2,
                    ),
                    child: Slider(value: status.value, onChanged: (value) {}),
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
