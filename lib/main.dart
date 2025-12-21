import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hr_management/core/design_system/components/app_bar.dart' show CustomAppBar;
import 'package:hr_management/core/design_system/theme/hr_management_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
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
      themeMode: ThemeMode.light,
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
      appBar: CustomAppBar(
        // title: 'title',
        // showBackButton: true,
    profileName: 'Tonald Drump',
    profileJobTitle: 'Junior Full Stack Developer',
    profileAvatarUrl: 'https://example.com/avatar.jpg', // Optional
    showBackButton: false, // No back button in profile
    onChatPressed: () { /* handle chat */ },
    onBellPressed: () { /* handle notifications */ },
  ),
      body: Column(
        mainAxisAlignment: .center,
        children: [
          ElevatedButton(onPressed: () {}, child: Text("language".tr())),
        ],
      ),
    );
  }
}
