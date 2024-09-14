import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class UserProgressChart extends StatelessWidget {
  const UserProgressChart({
    super.key,
    required this.usersProgress,
  });
  final Map<String, List<double>> usersProgress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'User Progress Over Time',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 300, // Define the height of the graph
          child: LineChart(
            LineChartData(
              maxY: 8, // Set maximum y value to 8
              lineBarsData: _generateUserLines(),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(
                          value.toInt().toString(),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.blueGrey,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          value.toInt().toString(),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.blueGrey,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              gridData: FlGridData(
                show: true,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: Colors.blueGrey.withOpacity(0.3),
                    strokeWidth: 1,
                  );
                },
                getDrawingVerticalLine: (value) {
                  return FlLine(
                    color: Colors.blueGrey.withOpacity(0.3),
                    strokeWidth: 1,
                  );
                },
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: Colors.blueGrey, width: 1),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        _buildLegend(), // Add legend for user colors
      ],
    );
  }

  // Generate the data for each user's line
  List<LineChartBarData> _generateUserLines() {
    List<LineChartBarData> lines = [];
    int userIndex = 0;
    final List<Color> colors = [
      Colors.green,
      Colors.blue
    ]; // Use green and blue

    usersProgress.forEach((username, progress) {
      lines.add(
        LineChartBarData(
          spots: List.generate(
            progress.length,
            (index) => FlSpot(
              index.toDouble(),
              progress[index],
            ),
          ),
          isCurved: false, // Set to false to make the lines straight
          dotData: const FlDotData(show: false),
          color: colors[
              userIndex % colors.length], // Alternate between green and blue
          barWidth: 3, // Make the lines thicker for better visibility
          belowBarData: BarAreaData(show: false),
        ),
      );
      userIndex++;
    });
    return lines;
  }

  // Build a legend to display usernames and their associated colors
  Widget _buildLegend() {
    List<Widget> legendItems = [];
    int userIndex = 0;
    final List<Color> colors = [
      Colors.green,
      Colors.blue
    ]; // Use green and blue

    usersProgress.forEach((username, progress) {
      legendItems.add(Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: colors[userIndex % colors.length],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            username,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ));
      userIndex++;
    });

    return Wrap(
      spacing: 20,
      runSpacing: 10,
      children: legendItems,
    );
  }
}
