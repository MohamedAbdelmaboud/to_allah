import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:to_allah/features/login/ui/widgets/custom_text_field.dart';

class LoginFields extends StatelessWidget {
  const LoginFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          labeltext: 'البريد الإلكتروني',
          onChanged: (value) {},
        ),
        const Gap(15),
        CustomTextField(
          labeltext: 'كلمة المرور',
          onChanged: (value) {},
        ),
      ],
    );
  }
}
