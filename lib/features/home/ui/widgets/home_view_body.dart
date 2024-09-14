import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:to_allah/core/routing/app_router.dart';
import 'package:to_allah/core/utils/app_colors.dart';
import 'package:to_allah/features/home/ui/widgets/table_logo.dart';

import '../../data/cubits/home_cubit.dart';
import 'home_table_page_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TableLogo(),
        Gap(20),
        HomeTablePageView(),
        Gap(20),
        HomeProgressButton(),
        // LogoutButton(),
      ],
    );
  }
}

class HomeProgressButton extends StatelessWidget {
  const HomeProgressButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final progress = context.read<HomeCubit>().getUsersDaysProgress();
        context.push(
          AppRouter.progress,
          extra: progress,
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            'View Progress',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
