import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_management/core/di/injection_container.dart';
import 'package:hr_management/core/presentation/design_system/components/app_bar.dart';
import 'package:hr_management/features/auth/domain/use_cases/logout_use_case.dart';
import '../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../core/presentation/routes/config/app_state_notifier.dart';
import '../../../../core/presentation/routes/route_names.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Home",
        showBackButton: false,
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              context.push(RouteNames.profile);
            },
            icon: const Icon(Icons.person, color: Colors.purple),
            style: IconButton.styleFrom(
              backgroundColor: context.colors.purple100,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(8),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {
              _showLogoutDialog(context);
            },
            icon: const Icon(Icons.logout, color: Colors.red),
            style: IconButton.styleFrom(
              backgroundColor: context.colors.purple100,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(8),
            ),
          ),
        ],
      ),
      body: const Center(child: Text("Welcome Back!")),
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
