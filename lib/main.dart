import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/components/expense_history_card.dart';
import 'package:hr_management/core/design_system/theme/hr_management_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      body: Column(
        mainAxisAlignment: .center,
        children: [ExpenseHistoryCard(type: "E-Learning", totalExpense: 55)],
      ),
    );
  }
}
