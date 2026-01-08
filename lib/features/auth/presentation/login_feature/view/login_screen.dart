import 'package:flutter/material.dart';
import 'package:hr_management/core/design_system/components/popups/sign_in_popup.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: .center,
        children: [
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => SignInPopup(),
              );
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}
