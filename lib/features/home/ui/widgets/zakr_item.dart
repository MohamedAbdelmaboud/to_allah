import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:to_allah/core/utils/app_styles.dart';

import '../../data/models/table_row_info.dart';

class ZakrItem extends StatelessWidget {
  const ZakrItem({
    super.key,
    required this.azkarModel,
  });
  final TableRowInfo azkarModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
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
      ),
    );
  }
}
