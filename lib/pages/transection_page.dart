import 'package:expenseapp/const_things.dart';
import 'package:expenseapp/models/expence_model.dart';
import 'package:expenseapp/models/income_model.dart';
import 'package:expenseapp/widgets/Expence_card.dart';
import 'package:expenseapp/widgets/encome_card.dart';
import 'package:flutter/material.dart';

class TransectionPage extends StatefulWidget {
  final Function(ExpenceModel) expenceDelete;
  final Function(EncomeModel) encomeDelete;
  final List<EncomeModel> encomeList;
  final List<ExpenceModel> expenceList;
  const TransectionPage({
    super.key,
    required this.expenceList,
    required this.encomeList,
    required this.encomeDelete,
    required this.expenceDelete,
  });

  @override
  State<TransectionPage> createState() => _TransectionPageState();
}

class _TransectionPageState extends State<TransectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "See your financila report",
                style: TextStyle(
                  color: Color.fromARGB(255, 240, 4, 99),
                  fontSize: 20,
                ),
              ),
              const Text(
                "Expences",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Expanded(
                child: ListView.builder(
                  // physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.expenceList.length,
                  itemBuilder: (context, index) {
                    final expence = widget.expenceList[index];
                    return Dismissible(
                      key: ValueKey(expence),
                      direction: DismissDirection.startToEnd,
                      onDismissed: (direction) {
                        widget.expenceDelete(expence);
                      },
                      child: ExpenceCard(
                        expenceCatogory: expence.expenceCatogory,
                        expenceTitle: expence.expenceTitle,
                        expenceDescription: expence.expenceDescription,
                        expenceAmount: expence.expenceAmount,
                        expenceDate: expence.expenceDate,
                        expenceTime: expence.expenceTime,
                      ),
                    );
                  },
                ),
              ),
              sizeSpacerHeight1,
              const Text(
                "Encome",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Expanded(
                child: ListView.builder(
                  // physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.encomeList.length,
                  itemBuilder: (context, index) {
                    final encome = widget.encomeList[index];
                    return Dismissible(
                      key: ValueKey(encome),
                      direction: DismissDirection.startToEnd,
                      onDismissed: (direction) {
                        widget.encomeDelete(encome);
                      },
                      child: EncomeCard(
                        catogory: encome.catogory,
                        title: encome.title,
                        description: encome.description,
                        amount: encome.amount,
                        date: encome.date,
                        time: encome.time,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
