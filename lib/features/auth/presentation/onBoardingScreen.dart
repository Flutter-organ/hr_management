import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/features/auth/presentation/sign_up_screan/logic/sign_up_cubit.dart';
import 'package:hr_management/features/auth/presentation/sign_up_screan/view/sign_up_screen.dart';

import '../../../core/di/injection_container.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>
                        BlocProvider(
                          create: (context) => sl<SignUpCubit>(),
                          child: SignUpScreen(),
                        )

                    ));
              },
              child: Text("Sign Up"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Sign In"),
            ),
          ],
        ),
      ),
    );
  }
}
