import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:to_allah/core/routing/app_router.dart';
import 'package:to_allah/core/widgets/custom_button.dart';

import 'widgets/login_fields.dart';
import 'widgets/login_logo.dart';
import 'widgets/login_message.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String loginMessage =
      ' وَابْتَغِ فِيمَا آتَاكَ اللَّهُ الدَّارَ الْآخِرَةَ وَلَا تَنْسَ نَصِيبَكَ مِنَ الدُّنْيَا';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LoginLogo(),
            const Gap(20),
            const LoginMessage(loginMessage: loginMessage),
            const Gap(20),
            const LoginFields(),
            const Gap(15),
            CustomButton(
              buttonText: 'تسجيل الدخول',
              onTap: () {
                context.push(AppRouter.home);
              },
            ),
          ],
        ),
      ),
    );
  }
}
