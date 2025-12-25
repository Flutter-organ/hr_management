import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:hr_management/core/design_system/components/property_good_poor.dart';
>>>>>>> system_design
import 'package:hr_management/core/design_system/theme/hr_management_theme.dart';

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
<<<<<<< HEAD
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
=======
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () {}, child: Text("language".tr())),
        ],
>>>>>>> system_design
      ),
    );
  }
}
