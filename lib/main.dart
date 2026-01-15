import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hr_management/core/config/app_config.dart';
import 'package:hr_management/core/design_system/theme/hr_management_theme.dart';
import 'package:toastification/toastification.dart';
import 'core/di/injection_container.dart';
import 'core/routes/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await AppConfig.init();
  await setupDependencies();
  runApp(
    ToastificationWrapper(
      child: EasyLocalization(
        supportedLocales: const [Locale('ar'), Locale('en')],
        path: 'assets/translations',
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'HR Management',
      theme: HrManagementTheme.light(),
      darkTheme: HrManagementTheme.dark(),
      themeMode: ThemeMode.light,
      routerConfig: router,
    );
  }
}