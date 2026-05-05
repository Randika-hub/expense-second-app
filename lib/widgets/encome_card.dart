import 'package:expenseapp/const_things.dart';
import 'package:expenseapp/models/income_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EncomeCard extends StatelessWidget {
  final EncomeCatogory catogory;

  final String title;
  final String description;
  final double amount;
  final DateTime date;
  final DateTime time;
  const EncomeCard({
    super.key,
    required this.catogory,
    required this.title,
    required this.description,
    required this.amount,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: encomeCatogoryColor[catogory],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              incomeCatogoryImages[catogory]!,
              fit: BoxFit.cover,
              width: 60,
            ),
            sizeSpacerHeight2,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),

                  Text(
                    description,
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
                    "+ \$ $amount",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 11, 35, 214),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateFormat.jm().format(time),
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
