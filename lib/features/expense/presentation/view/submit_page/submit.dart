import 'package:flutter/material.dart';
import 'package:hr_management/core/presentation/design_system/components/app_bar.dart';
import 'package:hr_management/core/presentation/design_system/components/custom_input_field.dart';
import 'package:hr_management/core/presentation/design_system/components/home_banner.dart';
import 'package:hr_management/core/presentation/design_system/components/upload_claim_document.dart';
import 'package:hr_management/core/presentation/design_system/theme/helper/app_assets.dart';
import 'package:hr_management/core/presentation/design_system/theme/helper/theme_extention.dart';
import 'package:iconsax/iconsax.dart';

class Submit extends StatelessWidget {
  const Submit({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double designWidth = 390;
    double designHeight = 844;
    return Scaffold(
      backgroundColor: context.colors.gray200,
      appBar: CustomAppBar(title: "Submit Expense"),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 16 / designWidth * width,
            vertical: 16 / designHeight * height,
          ),
          child: Column(
            children: [_banner(), SizedBox(height: 16), _expenseForm(context)],
          ),
        ),
      ),
    );
  }

  Widget _banner() {
    return Container(
      width: double.infinity,
      height: 100,
      child: HomeBanner(
        title: "Submit",
        subtitle: AppAssets.submitBunner,
        image: AppAssets.submitBunner,
        offsetRight: -50,
      ),
    );
  }

  Widget _expenseForm(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Fill Claim Information"),
          Text("Information about claim details"),
          _textFeildLabel("Expense Type", context),
          SizedBox(height: 16),
          UploadClaimDocument(
            onFilePicked: (file) {
              // Handle the picked file
            },
          ),
          SizedBox(height: 16),
          CustomInputField(
            prefixIcon: Icon(Iconsax.calendar1),
            contentPaddingVertical: 32,
          ),
          SizedBox(height: 16),
          _textFeildLabel("Transaction Date", context),
          SizedBox(height: 16),
          CustomInputField(
            prefixIcon: Icon(Iconsax.calendar1),
            contentPaddingVertical: 32,
          ),
          SizedBox(height: 16),
          _textFeildLabel("Expense Amount (\$USD)", context),
          SizedBox(height: 16),
          CustomInputField(
            prefixIcon: Icon(Iconsax.calendar1),
            contentPaddingVertical: 32,
          ),
          SizedBox(height: 16),
          _textFeildLabel("Expense Description", context),
          SizedBox(height: 16),
          CustomInputField(
            prefixIcon: Icon(Iconsax.calendar1),
            contentPaddingVertical: 32,
          ),
          SizedBox(height: 16),
          _textFeildLabel("Expense Description", context),
          SizedBox(height: 16),
          CustomInputField(
            prefixIcon: Icon(Iconsax.calendar1),
            contentPaddingVertical: 32,
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _textFeildLabel(String label, BuildContext context) {
    return Text(label, style: context.textTheme.bodyMediumFont);
  }
}
