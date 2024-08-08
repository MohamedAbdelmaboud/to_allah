import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:to_allah/core/helpers/date_to_string.dart';
import 'package:to_allah/core/utils/app_styles.dart';
import 'package:to_allah/features/home/data/cubits/home_cubit.dart';
import 'package:to_allah/features/home/ui/widgets/home_table_body.dart';

class HomeTablePageView extends StatelessWidget {
  const HomeTablePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeCubitState>(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final cubit = context.read<HomeCubit>();

        return PageView.builder(
          reverse: true,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Text(
                  dateToString(cubit.dates[index]), // Display the date
                  style: AppStyles.kufamStyle14,
                ),
                const Gap(10),
                const HomeTableBody(),
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
