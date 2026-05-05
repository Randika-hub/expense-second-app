import 'package:flutter/material.dart';

//Encome catogory enum
enum EncomeCatogory { salary, freelancing, passive, other }

//income Catogory images
final Map<EncomeCatogory, String> incomeCatogoryImages = {
  EncomeCatogory.salary: "assets/images/salary.png",
  EncomeCatogory.freelancing: "assets/images/freelance.png",
  EncomeCatogory.passive: "assets/images/car.png",
  EncomeCatogory.other: "assets/images/health.png",
};

//income catogory Color
final Map<EncomeCatogory, Color> encomeCatogoryColor = {
  EncomeCatogory.salary: Colors.greenAccent.shade100,
  EncomeCatogory.freelancing: Colors.red.shade200,
  EncomeCatogory.passive: Colors.yellow.shade200,
  EncomeCatogory.other: Colors.pink.shade200,
};

class EncomeModel {
  final EncomeCatogory catogory;

  final String title;
  final String description;
  final double amount;
  final DateTime date;
  final DateTime time;

  EncomeModel({
    required this.catogory,

    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.amount,
  });

  //json serealization for create a conver to dart data convert into json format
  Map<String, dynamic> tojson() {
    return {
      "catogory": catogory.index,

      "title": title,
      "description": description,
      "amount": amount,
      "date": date.toIso8601String(),
      "time": time.toIso8601String(),
    };
  }

  //created a methred json data convert into a dart object data,
  factory EncomeModel.fromJson(Map<String, dynamic> json) {
    return EncomeModel(
      catogory: EncomeCatogory.values[json["expenceCatogory"]],

      title: json["title"],
      description: json[" description"],
      amount: json["amount"],
      date: json["date"],
      time: json["time"],
    );
  }
}
