import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:to_allah/features/login/ui/widgets/custom_text_field.dart';

import '../../cubits/login_cubit.dart';

class LoginFields extends StatefulWidget {
  const LoginFields({
    super.key,
  });

  @override
  State<LoginFields> createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {
  String username = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          labeltext: 'اسم المستخدم',
          onChanged: context.read<LoginCubit>().updateEmail,
        ),
        const Gap(15),
        CustomTextField(
          labeltext: 'كلمة المرور',
          onChanged: context.read<LoginCubit>().updatePassword,
        ),
      ],
    );
  }
}
