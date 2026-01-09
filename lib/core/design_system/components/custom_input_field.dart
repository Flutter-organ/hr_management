import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';

class CustomInputField extends StatelessWidget {
  final String? hintKey;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Color? textInputColor;
  final Function()? onTap;
  final bool enabled;
  final bool isSelected;
  final bool evaluation;
  final bool isObscureText;
  final bool isDigitOnly;
  final String? Function(String?)? validator;
  final int minLines;
  final int maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String)? onChanged;
  final Function()? onSaved;
  final Color? borderColor;
  final Color? filledColor;
  final Color? labelHintStyle;
  final Color? labelErrorStyle;
  final List<TextInputFormatter>? inputFormatter;
  final bool? isReadOnly;
  final TextInputAction? action;
  final TextAlign? labelHintTextAlign;
  final double? radius;
  final bool? alignMultipleLines;
  final FocusNode? fieldFocusNode;
  final Offset? shadowOffset;
  final double? contentPaddingHorizontal;
  final double? contentPaddingVertical;
  final double? hintFontSize;
  final Color? focuseAndErrorColor;
  final Color? enabledColor;
  final InputBorder? border;
  final String? label;
  final Color? labelColor;

  const CustomInputField({
    Key? key,
    this.hintKey,
    this.controller,
    this.keyboardType,
    this.textInputColor,
    this.onTap,
    this.enabled = true,
    this.isSelected = false,
    this.evaluation = false,
    this.isObscureText = false,
    this.isDigitOnly = false,
    this.validator,
    this.minLines = 1,
    this.maxLines = 1,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onSaved,
    this.borderColor,
    this.filledColor,
    this.labelHintStyle,
    this.labelErrorStyle,
    this.inputFormatter,
    this.isReadOnly,
    this.action,
    this.labelHintTextAlign,
    this.radius,
    this.alignMultipleLines,
    this.fieldFocusNode,
    this.shadowOffset,
    this.contentPaddingHorizontal,
    this.contentPaddingVertical,
    this.focuseAndErrorColor,
    this.hintFontSize,
    this.border,
    this.enabledColor,
    this.label,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        label != null
            ? Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                label!,
                style: context.textTheme.bodySmallFont.copyWith(
                  color: labelColor!,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 4),
          ],
        )
            : const SizedBox(height: 0),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          style: context.textTheme.bodyMediumFont.copyWith(
            color: textInputColor ?? context.colors.textPrimary,
          ),
          onTap: onTap,
          enabled: enabled,
          obscureText: isObscureText,
          readOnly: isReadOnly ?? false,
          decoration: InputDecoration(
            hintText: hintKey,
            hintStyle: context.textTheme.bodyMediumFont.apply(
              color: labelHintStyle ?? context.colors.gray400,
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            contentPadding: EdgeInsets.symmetric(
              horizontal: contentPaddingHorizontal ?? 0.0,
              vertical: contentPaddingVertical ?? 0.0,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 0),
              borderSide: BorderSide(
                color: focuseAndErrorColor ?? context.colors.purple500,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 4.00),
              borderSide: BorderSide(
                color: focuseAndErrorColor ?? context.colors.error500,
              ),
            ),
            errorStyle: context.textTheme.bodySmallFont.copyWith(
              color: labelErrorStyle,
            ),
            errorMaxLines: 2,
            fillColor: filledColor,
            filled: true,
            isDense: true,
            labelStyle: context.textTheme.bodyMediumFont.copyWith(
              color: labelHintStyle ?? context.colors.gray600,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 4.00),
              borderSide: BorderSide(
                color: enabledColor ?? context.colors.gray400,
              ),
            ),
            border: border ?? InputBorder.none,
          ),
          validator: validator,
          minLines: minLines,
          maxLines: maxLines,
          onChanged: onChanged,
          inputFormatters: [
            if (isDigitOnly)
              FilteringTextInputFormatter.digitsOnly
            else
              ...inputFormatter ?? [],
          ],
          focusNode: fieldFocusNode,
          textInputAction: action,
        ),
      ],
    );
  }
}
