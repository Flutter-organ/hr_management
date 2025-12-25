import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';
import 'package:hr_management/core/design_system/theme/hr_management_theme.dart';

import 'core/design_system/components/custom_primary_button.dart';
import 'core/design_system/components/summary_card.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      path: 'assets/translations',
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'HR Management',
      theme: HrManagementTheme.light(),
      darkTheme: HrManagementTheme.dark(),
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'HR Management Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SummaryCard(
            title: 'Total Expense',
            subtitle: 'Period 1 Jan 2024 - 30 Dec 2024',
            items: [
              StatItemModel(
                label: 'Total',
                value: '\$1010',
                icon: const Icon(
                  Icons.account_balance_wallet,
                  size: 10,
                  color: Color(0xFF5B6EF5),
                ),
              ),
              StatItemModel(
                label: 'Review',
                value: '\$455',
                indicatorColor: const Color(0xFFFFAA00),
              ),
              StatItemModel(
                label: 'Approved',
                value: '\$555',
                indicatorColor: const Color(0xFF4CAF50),
              ),
            ],
            buttons: [
              CustomPrimaryButton(
                title: 'Clock In Now',
                backGroundColor: context.colors.primary,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
