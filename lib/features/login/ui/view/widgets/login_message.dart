import 'package:flutter/material.dart';
import 'package:to_allah/core/utils/app_colors.dart';
import 'package:to_allah/core/utils/app_styles.dart';

class LoginMessage extends StatelessWidget {
  const LoginMessage({
    super.key,
    required this.loginMessage,
  });

  final String loginMessage;

  @override
  Widget build(BuildContext context) {
    return Text(
      loginMessage,
      style: AppStyles.amiriStyle16.copyWith(
        color: AppColors.secondaryColor.withOpacity(0.6),
      ),
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    );
  }
}
