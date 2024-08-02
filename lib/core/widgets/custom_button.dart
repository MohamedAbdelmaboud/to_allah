import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:to_allah/core/utils/app_colors.dart';

import '../utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    this.onTap,
  });
  final String buttonText;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primaryColor.withOpacity(0.5),
                  AppColors.secondaryColor,
                  AppColors.primaryColor.withOpacity(0.5),
                ]),
            border: GradientBoxBorder(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primaryColor.withOpacity(0.5),
                    AppColors.primaryColor,
                    AppColors.primaryColor.withOpacity(0.5),
                  ]),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            buttonText,
            style: AppStyles.uthmanicStyle18.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          )),
    );
  }
}
