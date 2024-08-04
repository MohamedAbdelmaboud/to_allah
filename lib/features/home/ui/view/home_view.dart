import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_allah/core/extensions/snack_bar_extension.dart';

import '../../data/cubits/home_cubit.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<HomeCubit, HomeCubitState>(
        listener: (context, state) {
          if (state is HomeErrorState) {
            context.showSnackBar(message: state.message);
          }
        },
        child: const HomeViewBody(),
      ),
    );
  }
}
