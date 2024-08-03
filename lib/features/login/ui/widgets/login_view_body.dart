import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:to_allah/core/widgets/custom_button.dart';
import 'package:to_allah/features/login/cubits/login_cubit.dart';
import 'package:to_allah/features/login/ui/widgets/login_fields.dart';
import 'package:to_allah/features/login/ui/widgets/login_logo.dart';
import 'package:to_allah/features/login/ui/widgets/login_message.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });

  static const String loginMessage =
      ' وَابْتَغِ فِيمَا آتَاكَ اللَّهُ الدَّارَ الْآخِرَةَ وَلَا تَنْسَ نَصِيبَكَ مِنَ الدُّنْيَا';
  @override
  Widget build(BuildContext context) {
    return Padding(
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
            onTap: context.read<LoginCubit>().login,
          ),
        ],
      ),
    );
  }
}
