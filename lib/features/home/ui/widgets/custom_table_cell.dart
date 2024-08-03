import 'package:flutter/material.dart';
import 'package:to_allah/core/utils/app_styles.dart';

import '../../data/moedls/user_model.dart';

class CustomTableCell extends StatelessWidget {
  const CustomTableCell({
    super.key,
    required this.userModel,
  });
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          userModel.name,
          style: AppStyles.kufamStyle14,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
