import 'package:expenseapp/const_things.dart';
import 'package:expenseapp/models/expence_model.dart';
import 'package:expenseapp/models/income_model.dart';
import 'package:expenseapp/widgets/pie_chart.dart';
import 'package:expenseapp/widgets/prograss_card.dart';
import 'package:flutter/material.dart';

class BudgetPage extends StatefulWidget {
  final Map<ExpenceCatogory, double> expenceCatogoryListPieChart;
  final Map<EncomeCatogory, double> encomeCatogoryListPieChart;
  const BudgetPage({
    super.key,
    required this.expenceCatogoryListPieChart,
    required this.encomeCatogoryListPieChart,
  });

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  int changeExpenceAndEncome = 1;

  Color getColor(dynamic catogory) {
    if (catogory is ExpenceCatogory) {
      return expenceCatogoryColor[catogory]!;
    } else {
      return encomeCatogoryColor[catogory]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = changeExpenceAndEncome == 1
        ? widget.expenceCatogoryListPieChart
        : widget.encomeCatogoryListPieChart;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "budget page",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: MediaQuery.of(context).size.height * 0.09,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,

                    boxShadow: const [
                      BoxShadow(color: Colors.grey, blurRadius: 20),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              changeExpenceAndEncome = 1;
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.43,
                            height: MediaQuery.of(context).size.height * 0.07,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: changeExpenceAndEncome == 1
                                  ? Colors.red
                                  : Colors.white,
                            ),
                            child: const Center(
                              child: Text(
                                'Expence',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              changeExpenceAndEncome = 2;
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.43,
                            height: MediaQuery.of(context).size.height * 0.07,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: changeExpenceAndEncome == 2
                                  ? Colors.green
                                  : Colors.white,
                            ),
                            child: const Center(
                              child: Text(
                                'Encome',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              PieChart11(
                expenceCatogoryListPieChart: widget.expenceCatogoryListPieChart,
                encomeCatogoryListPieChart: widget.encomeCatogoryListPieChart,
                isExpence: changeExpenceAndEncome == 1,
              ),
              sizeSpacerHeight2,

              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final category = data.keys.toList()[index];
                  final total = data.values.toList()[index];
                  return PrograssCard(
                    name: category.name,
                    prograssColor: getColor(category),
                    amount: total,
                    total: data.values.reduce(
                      (value, element) => value + element,
                    ),
                    isExpence: changeExpenceAndEncome == 1,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
