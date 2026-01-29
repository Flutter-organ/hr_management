import 'package:flutter/material.dart';
import 'package:hr_management/core/di/injection_container.dart';
import 'package:hr_management/core/presentation/design_system/components/custom_status_bar.dart';
import 'package:hr_management/features/auth/domain/use_cases/logout_use_case.dart';
import '../../../../core/presentation/routes/config/app_state_notifier.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        actions: [
          IconButton(
            onPressed: () {
              _showLogoutDialog(context);
            },
            icon: const Icon(Icons.logout, color: Colors.red),
          ),
        ],
      ),
      body: const Center(
        child: CustomStatusBar(
          tapOneCount: 2,
          tapTwoCount: 0,
          tapThreeCount: 0,
          tapOne: "All",
          tapTwo: "In Progress",
          tapThree: "Finish",
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to exit?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              final result = await sl<LogoutUseCase>().call();
              result.fold((failure) => print(failure.message), (_) {
                AuthStateNotifier.instance.setLoggedOut();
              });
            },
            child: const Text("Logout", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
