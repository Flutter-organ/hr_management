import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/design_system/components/custom_input_field.dart';
import '../../../../../core/design_system/theme/helper/theme_extention.dart';
import '../logic/sign_up_cubit.dart';
import '../logic/sign_up_state.dart';
Widget buildPhoneNumber(BuildContext context, TextEditingController _phoneController) {
  final cubit = context.read<SignUpCubit>();
  List<String> countryFilter = [
    'EG',
    'PS',
    'SA',
    'AE',
    'KW',
    'QA',
    'JO',
    'LB',
    'SY',
    'IQ',
    'OM',
    'BH',
    'LY',
    'MA',
    'DZ',
    'TN',
    'SD',
    'YE',
  ];
  return BlocBuilder<SignUpCubit, SignUpUiState>(
    buildWhen: (previous, current) => current.countryCode!=previous.countryCode,
    builder: (context, state) {
      return CustomInputField(
          label: "phone_number".tr(),
          labelColor: context.colors.textPrimary,
          controller: _phoneController,
          borderColor: context.colors.gray400,
          filledColor: context.colors.white,
          keyboardType: TextInputType.number,
          hintKey: "phone_hint".tr(),
          labelHintStyle: context.colors.gray400,
          hintFontSize: 4,
          enabledColor: context.colors.gray400,
          radius: 8,
          prefixIcon: InkWell(
            onTap: () {
              showCountryPicker(
                moveAlongWithKeyboard: true,
                context: Navigator.of(context, rootNavigator: true).context,
                countryListTheme: CountryListThemeData(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  textStyle: context.textTheme.titleSmallFont.copyWith(
                    color: context.colors.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                  searchTextStyle: context.textTheme.titleSmallFont
                      .copyWith(color: context.colors.textPrimary),
                  inputDecoration: InputDecoration(
                    labelText: 'search'.tr(),
                    hintText: 'search_country'.tr(),
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  bottomSheetHeight:
                  MediaQuery.of(context).size.height * 0.6,
                ),
                showPhoneCode: true,
                countryFilter: countryFilter,
                favorite: ['PS', 'EG', 'SA'],
                onSelect: (Country country) {
                  cubit.setCountryCode(country.phoneCode);
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    cubit.state.countryCode,
                    style: context.textTheme.titleSmallFont.copyWith(
                      color: context.colors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Iconsax.arrow_down_1,
                    color: context.colors.purple500,
                  ),
                ],
              ),
            ),
          ),
          validator: cubit.validatePhone
      );
    },
  );

}
