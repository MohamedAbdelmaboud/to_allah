import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:to_allah/core/utils/app_styles.dart';
import 'package:to_allah/features/home/data/models/azkar_model.dart';

class ZakrItem extends StatelessWidget {
  const ZakrItem({
    super.key,
    required this.azkarModel,
  });
  final AzkarModel azkarModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          azkarModel.title,
          style: AppStyles.kufamStyle12,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        ),
        const Gap(5),
        Image.asset(
          azkarModel.imagePath,
          height: 20,
        ),
      ],
    );
  }
}
