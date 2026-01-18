import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/core/design_system/components/popups/sign_in_popup.dart';
import 'package:hr_management/core/design_system/theme/helper/popup_helper.dart';
import 'package:hr_management/core/di/injection_container.dart';
import 'package:hr_management/features/auth/presentation/login_feature/cubit/login_cubit.dart';

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
              PopupHelper.show(
                enableDrag: false,
                context: context,
                popup: BlocProvider(
                  create: (context) => sl<LoginCubit>(),
                  child: SignInPopup(),
                ),
              );
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}
