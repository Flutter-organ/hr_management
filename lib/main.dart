import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/theme/helper/theme_extention.dart';
import 'package:hr_management/core/design_system/theme/hr_management_theme.dart';

import 'core/design_system/components/check_box.dart';

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
  bool _isChecked = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomCheckbox(
              isChecked: _isChecked,
              isEnabled: false,
              label: 'This is a check box',
              size: 24,
              onChanged: (value) => setState(() => _isChecked = value),
            ),
            SizedBox(height: 20),
            CustomCheckbox(
              isChecked: _isChecked,
              isEnabled: true,
              label: 'This is a check box',
              size: 24,
              onChanged: (value) => setState(() => _isChecked = value),
            ),
            SizedBox(height: 20),
            CustomCheckbox(
              isChecked: _isChecked,
              isEnabled: true,
              size: 24,
              onChanged: (value) => setState(() => _isChecked = value),
            ),
            SizedBox(height: 20),
            CustomCheckbox(
              isChecked: _isChecked,
              isEnabled: true,
              size: 24,
              shadowColor: context.colors.primary,
              onChanged: (value) => setState(() => _isChecked = value),
            ),
          ],
        ),
      ),
    );
  }
}
