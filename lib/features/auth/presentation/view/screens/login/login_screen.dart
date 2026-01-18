import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/core/di/injection_container.dart';
import '../../../../../../core/design_system/theme/helper/app_assets.dart';
import '../../../../../../core/design_system/theme/helper/theme_extention.dart';
import '../../../logic/login/login_cubit.dart';
import '../../popups/login_popup.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.19, 1.0],
            colors: [
              context.colors.purple500,
              context.colors.white,
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(
                  sigmaX: 8.0,
                  sigmaY: 8.0,
                  tileMode: TileMode.decal,
                ),
                child: Image.asset(
                  AppAssets.registrationBackground,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SafeArea(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: BlocProvider(
                  create: (_) => sl<LoginCubit>(),
                  child: const LoginCard(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
