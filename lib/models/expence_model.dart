import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

part 'expence_model.g.dart';

enum ExpenceCatogory { shopping, subscriptions, food, health, transport }

final Map<ExpenceCatogory, String> expenceCatogoryImages = {
  ExpenceCatogory.shopping: "assets/images/bag.png",
  ExpenceCatogory.subscriptions: "assets/images/bill.png",
  ExpenceCatogory.food: "assets/images/restaurant.png",
  ExpenceCatogory.health: "assets/images/health.png",
  ExpenceCatogory.transport: "assets/images/car.png",
};

final Map<ExpenceCatogory, Color> expenceCatogoryColor = {
  ExpenceCatogory.shopping: const Color.fromARGB(255, 100, 234, 88),
  ExpenceCatogory.subscriptions: const Color.fromARGB(255, 113, 173, 221),
  ExpenceCatogory.food: const Color.fromARGB(255, 103, 103, 218),
  ExpenceCatogory.health: const Color.fromARGB(255, 200, 125, 213),
  ExpenceCatogory.transport: const Color.fromARGB(255, 71, 235, 221),
};

@HiveType(typeId: 1)
class ExpenceModel {
  @HiveField(0)
  final String expenceTitle;

  @HiveField(1)
  final String expenceDescription;

  @HiveField(2)
  final double expenceAmount;

  @HiveField(3)
  final DateTime expenceDate;

  @HiveField(4)
  final DateTime expenceTime;

  @HiveField(5)
  final ExpenceCatogory expenceCatogory;

  ExpenceModel({
    required this.expenceTitle,
    required this.expenceDescription,
    required this.expenceAmount,
    required this.expenceDate,
    required this.expenceTime,
    required this.expenceCatogory,
  });

  //save the data in shard prefereces

  // //json serealization for create a conver to dart data convert into json format
  // Map<String, dynamic> tojson() {
  //   return {
  //     "expenceCatogory": expenceCatogory.index,

  //     "expenceTitle": expenceTitle,
  //     "expenceDescription": expenceDescription,
  //     "expenceAmount": expenceAmount,
  //     "expenceDate": expenceDate.toIso8601String(),
  //     "expenceTime": expenceTime.toIso8601String(),
  //   };
  // }

  // //created a methred json data convert into a dart object data,
  // factory ExpenceModel.fromJson(Map<String, dynamic> json) {
  //   return ExpenceModel(
  //     expenceCatogory: ExpenceCatogory.values[json["expenceCatogory"]],

  //     expenceTitle: json["expenceTitle"],
  //     expenceDescription: json["expenceDescription"],
  //     expenceAmount: json["expenceAmount"],
  //     expenceDate: DateTime.parse(json["expenceDate"]),
  //     expenceTime: DateTime.parse(json["expenceTime"]),
  //   );
  // }
}
