import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:walletwise/models/category.dart';
import 'package:walletwise/constants/app_colors.dart';
import 'package:walletwise/data/graph_data.dart';

typedef PieDataExtractor = PieData Function(dynamic item);

class CategoryPieChart extends StatelessWidget {
  final Category data;
  final List<PieData> pieDataList;

  int index = -1;
  CategoryPieChart(this.data, {Key? key}) : pieDataList = data.getPieData();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        alignment: Alignment.center,
        children: [
          pieDataList.isNotEmpty
              ? PieChart(
                  PieChartData(
                    sectionsSpace: 4,
                    borderData: FlBorderData(show: false),
                    sections: pieDataList
                        .map((item) => PieChartSectionData(
                              showTitle: false,
                              titleStyle: const TextStyle(color: Colors.white),
                              value: item.value,
                              title: item.name,
                              color: getColor(++index),
                              radius: 20,
                            ))
                        .toList(),
                  ),
                  swapAnimationDuration:
                      const Duration(milliseconds: 150), // Optional
                  swapAnimationCurve: Curves.linear,
                )
              : const Text("no data found"),
          Text(
            data.amount.toString(),
            //"1000",
            //data.pieData.fold(0.0, (sum, item) => sum + item.value).toString(),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Color getColor(int index) {
    if (index == -1) {
      return Colors.red;
    }
    return AppColors.pieChartColors[index];
  }
}
