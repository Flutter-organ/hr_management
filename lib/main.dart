import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hr_management/core/config/app_config.dart';
import 'package:hr_management/core/design_system/theme/hr_management_theme.dart';
import 'package:hr_management/core/routes/route_names.dart';
import 'package:hr_management/features/auth/domain/repository/auth_repository.dart';
import 'core/di/injection_container.dart';

import 'core/routes/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await AppConfig.init();
  await setupDependencies();

  final hasToken = await sl<AuthRepository>().hasToken();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      path: 'assets/translations',
      child: MyApp(isLoggedIn: hasToken.fold((l) => false, (r) => r)),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    final String intialLocation = isLoggedIn
        ? RouteNames.homeScreen
        : RouteNames.loginRoute;
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'HR Management',
      theme: HrManagementTheme.light(),
      darkTheme: HrManagementTheme.dark(),
      themeMode: ThemeMode.light,
      routerConfig: createRouter(intialLocation),
    );
  }
}
