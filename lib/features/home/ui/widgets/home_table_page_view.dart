import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:to_allah/features/home/data/cubits/home_cubit.dart';
import 'package:to_allah/features/home/ui/widgets/home_table_body.dart';

import 'home_table_date.dart';
import 'table_shimmer.dart';

class HomeTablePageView extends StatelessWidget {
  const HomeTablePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeCubitState>(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const TableShimmer();
        }
        final cubit = context.read<HomeCubit>();
        return ExpandablePageView.builder(
          reverse: true,
          itemBuilder: (context, index) {
            return const Column(
              children: [
                HomeTableDate(),
                Gap(10),
                HomeTableBody(),
              ],
            );
          },
          onPageChanged: cubit.updateDayIndex,
          itemCount: cubit.usersData.first.data.length,
        );
      },
    );
  }
}
