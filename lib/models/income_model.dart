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
  EncomeCatogory.salary: Colors.black,
  EncomeCatogory.freelancing: Colors.red,
  EncomeCatogory.passive: Colors.yellow,
  EncomeCatogory.other: Colors.orange,
};

class IncomeModel {
  final EncomeCatogory catogory;
  final int id;
  final String title;
  final String description;
  final double amount;
  final DateTime date;
  final DateTime time;

  IncomeModel({
    required this.catogory,
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.amount,
  });
}
