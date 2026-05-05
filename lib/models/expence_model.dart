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
  ExpenceCatogory.shopping: Colors.orange.shade200,
  ExpenceCatogory.subscriptions: Colors.blue.shade200,
  ExpenceCatogory.food: Colors.lightGreenAccent.shade200,
  ExpenceCatogory.health: Colors.greenAccent.shade200,
  ExpenceCatogory.transport: Colors.yellow.shade200,
};

class ExpenceModel {
  final ExpenceCatogory expenceCatogory;

  final String expenceTitle;
  final String expenceDescription;
  final double expenceAmount;
  final DateTime expenceDate;
  final DateTime expenceTime;

  ExpenceModel({
    required this.expenceCatogory,

    required this.expenceTitle,
    required this.expenceDescription,
    required this.expenceAmount,
    required this.expenceDate,
    required this.expenceTime,
  });

  //save the data in shard prefereces

  //json serealization for create a conver to dart data convert into json format
  Map<String, dynamic> tojson() {
    return {
      "expenceCatogory": expenceCatogory.index,

      "expenceTitle": expenceTitle,
      "expenceDescription": expenceDescription,
      "expenceAmount": expenceAmount,
      "expenceDate": expenceDate.toIso8601String(),
      "expenceTime": expenceTime.toIso8601String(),
    };
  }

  //created a methred json data convert into a dart object data,
  factory ExpenceModel.fromJson(Map<String, dynamic> json) {
    return ExpenceModel(
      expenceCatogory: ExpenceCatogory.values[json["expenceCatogory"]],

      expenceTitle: json["expenceTitle"],
      expenceDescription: json["expenceDescription"],
      expenceAmount: json["expenceAmount"],
      expenceDate: DateTime.parse(json["expenceDate"]),
      expenceTime: DateTime.parse(json["expenceTime"]),
    );
  }
}
