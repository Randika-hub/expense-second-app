import 'package:flutter/material.dart';

enum ExpenceCatogory { shopping, subscriptions, food, health, transport }

final Map<ExpenceCatogory, String> expenceCatogoryImages = {
  ExpenceCatogory.shopping: "assets/images/bag.png",
  ExpenceCatogory.subscriptions: "assets/images/bill.png",
  ExpenceCatogory.food: "assets/images/restaurant.png",
  ExpenceCatogory.health: "assets/images/health.png",
  ExpenceCatogory.transport: "assets/images/car.png",
};

final Map<ExpenceCatogory, Color> expenceCatogoryColor = {
  ExpenceCatogory.shopping: Colors.deepOrange,
  ExpenceCatogory.subscriptions: Colors.blue,
  ExpenceCatogory.food: Colors.red,
  ExpenceCatogory.health: Colors.greenAccent,
  ExpenceCatogory.transport: Colors.yellow,
};

class ExpenceModel {
  final ExpenceCatogory expenceCatogory;
  final int ExpenceId;
  final String ExpenceTitle;
  final String ExpenceDescription;
  final double ExpenceAmount;
  final DateTime ExpenceDate;
  final DateTime ExpenceTime;

  ExpenceModel({
    required this.expenceCatogory,
    required this.ExpenceId,
    required this.ExpenceTitle,
    required this.ExpenceDescription,
    required this.ExpenceAmount,
    required this.ExpenceDate,
    required this.ExpenceTime,
  });
}
