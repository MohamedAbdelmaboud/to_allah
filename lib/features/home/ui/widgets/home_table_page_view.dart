import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_allah/features/home/data/cubits/home_cubit.dart';
import 'package:to_allah/features/home/ui/widgets/home_table_body.dart';

class HomeTablePageView extends StatelessWidget {
  const HomeTablePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeCubitState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        return PageView.builder(
          reverse: true,
          itemBuilder: (context, index) {
            return const HomeTableBody();
          },
          onPageChanged: cubit.updateDayIndex,
          itemCount: cubit.days.length,
        );
      },
    );
  }
}
