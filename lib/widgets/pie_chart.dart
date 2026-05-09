import 'package:expenseapp/models/expence_model.dart';
import 'package:expenseapp/models/income_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChart11 extends StatefulWidget {
  final Map<ExpenceCatogory, double> expenceCatogoryListPieChart;
  final Map<EncomeCatogory, double> encomeCatogoryListPieChart;
  final bool isExpence;
  const PieChart11({
    super.key,
    required this.expenceCatogoryListPieChart,
    required this.encomeCatogoryListPieChart,
    required this.isExpence,
  });

  @override
  State<PieChart11> createState() => _PieChart11State();
}

class _PieChart11State extends State<PieChart11> {
  //pie chart section data
  List<PieChartSectionData> pieChartSectionData() {
    if (widget.isExpence) {
      return [
        PieChartSectionData(
          color: expenceCatogoryColor[ExpenceCatogory.food],
          value: widget.expenceCatogoryListPieChart[ExpenceCatogory.food] ?? 0,
          showTitle: false,
          radius: 50,
        ),

        PieChartSectionData(
          color: expenceCatogoryColor[ExpenceCatogory.health],
          value:
              widget.expenceCatogoryListPieChart[ExpenceCatogory.health] ?? 0,
          showTitle: false,
          radius: 50,
        ),

        PieChartSectionData(
          color: expenceCatogoryColor[ExpenceCatogory.shopping],
          value:
              widget.expenceCatogoryListPieChart[ExpenceCatogory.shopping] ?? 0,
          showTitle: false,
          radius: 50,
        ),

        PieChartSectionData(
          color: expenceCatogoryColor[ExpenceCatogory.subscriptions],
          value:
              widget.expenceCatogoryListPieChart[ExpenceCatogory
                  .subscriptions] ??
              0,
          showTitle: false,
          radius: 50,
        ),

        PieChartSectionData(
          color: expenceCatogoryColor[ExpenceCatogory.transport],
          value:
              widget.expenceCatogoryListPieChart[ExpenceCatogory.transport] ??
              0,
          showTitle: false,
          radius: 50,
        ),
      ];
    } else {
      return [
        PieChartSectionData(
          color: encomeCatogoryColor[EncomeCatogory.freelancing],
          value:
              widget.encomeCatogoryListPieChart[EncomeCatogory.freelancing] ??
              0,
          showTitle: false,
          radius: 50,
        ),

        PieChartSectionData(
          color: encomeCatogoryColor[EncomeCatogory.other],
          value: widget.encomeCatogoryListPieChart[EncomeCatogory.other] ?? 0,
          showTitle: false,
          radius: 50,
        ),

        PieChartSectionData(
          color: encomeCatogoryColor[EncomeCatogory.passive],
          value: widget.encomeCatogoryListPieChart[EncomeCatogory.passive] ?? 0,
          showTitle: false,
          radius: 50,
        ),

        PieChartSectionData(
          color: encomeCatogoryColor[EncomeCatogory.salary],
          value: widget.encomeCatogoryListPieChart[EncomeCatogory.salary] ?? 0,
          showTitle: false,
          radius: 50,
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    // 1. මුළු එකතුව ගණනය කරන ලොජික් එක
    double totalAmount = 0;

    if (widget.isExpence) {
      // වියදම් වල මැප් එකේ තියෙන හැම වැලියු එකක්ම එකතු කරනවා
      widget.expenceCatogoryListPieChart.forEach((key, value) {
        totalAmount += value;
      });
    } else {
      // ආදායම් වල මැප් එකේ තියෙන හැම වැලියු එකක්ම එකතු කරනවා
      widget.encomeCatogoryListPieChart.forEach((key, value) {
        totalAmount += value;
      });
    }
    final PieChartData pieChartData = PieChartData(
      sectionsSpace: 0,
      startDegreeOffset: 90,
      centerSpaceRadius: 80,
      sections: pieChartSectionData(),
      borderData: FlBorderData(show: false),
    );

    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(pieChartData),
          Text(
            totalAmount.toStringAsFixed(2),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
