import 'package:flutter/material.dart';
import 'package:to_allah/features/home/ui/widgets/user_progress_chart.dart';

class ProgressView extends StatelessWidget {
  const ProgressView({
    super.key,
    required this.usersProgress,
  });
  final Map<String, List<double>> usersProgress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Progress')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: UserProgressChart(
          usersProgress: usersProgress,
        ),
      ),
    );
  }
}
