import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:to_allah/core/utils/app_colors.dart';
import 'package:to_allah/core/utils/app_images.dart';
import 'package:to_allah/core/utils/app_styles.dart';

class TableLogo extends StatelessWidget {
  const TableLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          Assets.assetsImagesTableLogoImage,
          height: 80,
        ),
        const Gap(10),
        Text(
          'جَدوَل تَنافُس في الخَير',
          style: AppStyles.kufamStyle14.copyWith(
            color: AppColors.secondaryColor.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}
