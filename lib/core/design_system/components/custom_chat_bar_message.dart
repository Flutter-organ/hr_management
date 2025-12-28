import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hr_management/core/design_system/theme/helper/app_assets.dart';
import 'package:hr_management/core/design_system/theme/helper/extention_colors.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';
import 'package:iconsax/iconsax.dart';

class CustomChatBarMessage extends StatelessWidget {
  final TextEditingController messageController;
  final String? hintText;

  final ValueChanged<String>? onSend;
  final VoidCallback? onRecord;
  final VoidCallback? onAttachTap;
  final VoidCallback? onCameraTap;

  const CustomChatBarMessage({
    super.key,
    required this.messageController,
    this.hintText,
    this.onSend,
    this.onRecord,
    this.onAttachTap,
    this.onCameraTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: context.colors.gray50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  _messageTextField(context),
                  const SizedBox(width: 16),
                  _attachButton(),
                  const SizedBox(width: 16),
                  _cameraButton(),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          _sendOrMicButton(context),
        ],
      ),
    );
  }

  Widget _messageTextField(BuildContext context) {
    return Expanded(
      child: TextFormField(
        controller: messageController,
        style: TextStyle(color: ExtensionColors.blackTitleProfile),
        decoration: InputDecoration(
          hintText: hintText ?? "type_a_message...".tr(),
          hintStyle: TextStyle(color: ExtensionColors.blackTitleProfile),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _attachButton() {
    return InkWell(
      onTap: onAttachTap,
      child: Icon(
        Iconsax.attach_circle,
        color: ExtensionColors.blackTitleProfile,
      ),
    );
  }

  Widget _cameraButton() {
    return InkWell(
      onTap: onCameraTap,
      child: Icon(Iconsax.camera, color: ExtensionColors.blackTitleProfile),
    );
  }

  Widget _sendOrMicButton(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: messageController,
      builder: (context, value, _) {
        final hasText = value.text.trim().isNotEmpty;
        return SizedBox(
          width: 56,
          height: 56,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(28),
              onTap: hasText ? () => onSend?.call(value.text.trim()) : onRecord,
              child: CircleAvatar(
                backgroundColor: ExtensionColors.iconDefault,
                child: Icon(
                  hasText ? Iconsax.send_2 : Iconsax.microphone,
                  color: context.colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
