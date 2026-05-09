import 'package:expenseapp/models/expence_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Database {
  final _mybox = Hive.box("ExpenecDatabase");

  List<ExpenceModel> expenceList = [];

  // initialize now data
  void createInitialDataBase() {
    expenceList = [
      // ExpenceModel(
      //   expenceTitle: "apple",
      //   expenceDescription: "I like to eate apple",
      //   expenceAmount: 55,
      //   expenceDate: DateTime.now(),
      //   expenceTime: DateTime.now(),
      //   expenceCatogory: ExpenceCatogory.food,
      // ),
    ];
  }

  //loard the data

  void loardDate() {
    final dynamic data = _mybox.get("ExpenceKey");

    if (data != null && data is List<dynamic>) {
      expenceList = data.cast<ExpenceModel>().toList();
    }
  }

  //update the data

  Future<void> updateTheData(BuildContext contex) async {
    await _mybox.put("ExpenceKey", expenceList);

    if (contex.mounted) {
      ScaffoldMessenger.of(
        contex,
      ).showSnackBar(const SnackBar(content: Text("save your Expence")));
    }
  }

  Future<void> removeExpencesaHiveDataBase(BuildContext context) async {
    var mybox = Hive.box("ExpenecDatabase");
    await mybox.clear();

    expenceList.clear();

    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Delete All Expences")));
    }
  }
}
