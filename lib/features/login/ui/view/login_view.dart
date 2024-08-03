import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:to_allah/core/extesions/snack_bar_extension.dart';
import 'package:to_allah/core/routing/app_router.dart';
import 'package:to_allah/features/login/cubits/login_cubit.dart';

import '../widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginCubitState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            context.go(AppRouter.home);
          } else if (state is LoginErrorState) {
            context.showSnackBar(message: state.message);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is LoginLoadingState,
            child: const LoginViewBody(),
          );
        },
      ),
    );
  }
}
