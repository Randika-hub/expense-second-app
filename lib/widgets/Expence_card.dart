import 'package:expenseapp/const_things.dart';
import 'package:expenseapp/models/expence_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenceCard extends StatelessWidget {
  final ExpenceCatogory expenceCatogory;

  final String expenceTitle;
  final String expenceDescription;
  final double expenceAmount;
  final DateTime expenceDate;
  final DateTime expenceTime;

  const ExpenceCard({
    super.key,
    required this.expenceCatogory,
    required this.expenceTitle,
    required this.expenceDescription,
    required this.expenceAmount,
    required this.expenceDate,
    required this.expenceTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: expenceCatogoryColor[expenceCatogory],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              expenceCatogoryImages[expenceCatogory]!,
              fit: BoxFit.cover,
              width: 60,
            ),
            sizeSpacerHeight2,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    expenceTitle,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),

                  Text(
                    expenceDescription,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "+ \$ $expenceAmount",
                    style: const TextStyle(
                      color: Color.fromRGBO(255, 11, 35, 214),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateFormat.jm().format(expenceTime),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
