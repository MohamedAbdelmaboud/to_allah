import 'package:flutter/material.dart';
import 'package:to_allah/core/utils/app_colors.dart';
import 'package:to_allah/core/utils/app_styles.dart';
import 'package:to_allah/core/widgets/custom_button.dart';
import 'package:to_allah/features/login/ui/view/widgets/custom_text_field.dart';

import '../../../../core/utils/app_images.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String loginMessage =
      ' وَابْتَغِ فِيمَا آتَاكَ اللَّهُ الدَّارَ الْآخِرَةَ وَلَا تَنْسَ نَصِيبَكَ مِنَ الدُّنْيَا';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            Assets.assetsImagesLogo,
            height: 100,
          ),
          Text(
            loginMessage,
            style: AppStyles.amiriStyle16.copyWith(
              color: AppColors.secondaryColor.withOpacity(0.6),
            ),
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
          ),
          const CustomTextField(
            labeltext: 'البريد الإلكتروني',
          ),
          const CustomTextField(
            labeltext: 'كلمة المرور',
          ),
          CustomButton(
            buttonText: 'تسجيل الدخول',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
